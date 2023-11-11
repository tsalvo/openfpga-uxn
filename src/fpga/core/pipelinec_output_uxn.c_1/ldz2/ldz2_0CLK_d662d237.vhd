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
-- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_77c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_0acd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal t8_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_21b1]
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1406_c3_0af4[uxn_opcodes_h_l1406_c3_0af4]
signal printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_96ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1410_c7_9293]
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1410_c7_9293]
signal t8_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_9293]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_9293]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_9293]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_9293]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_9293]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_9293]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_9293]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_64b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_7ff8]
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_72ea]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8a8c]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1419_c7_dfce]
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_dfce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_dfce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_dfce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_dfce]
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_dfce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_dfce]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_d8a0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_deca]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c7_fd99]
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_fd99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_fd99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_fd99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_fd99]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1425_c3_65eb]
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_8e30]
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1427_c7_b5d9]
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_b5d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_b5d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_b5d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_b5d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1428_c3_6db1]
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_3748]
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_ed72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_ed72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_ed72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_ed72]
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1435_c31_85c8]
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_1405]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_0642]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_0642]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5517( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1
tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- t8_MUX_uxn_opcodes_h_l1405_c2_21b1
t8_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
t8_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

-- printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4
printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4 : entity work.printf_uxn_opcodes_h_l1406_c3_0af4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1410_c7_9293
tmp16_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- t8_MUX_uxn_opcodes_h_l1410_c7_9293
t8_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
t8_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
t8_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
t8_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8
tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- t8_MUX_uxn_opcodes_h_l1413_c7_7ff8
t8_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea
sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce
tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_cond,
tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue,
tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse,
tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99
tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb
CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_x,
CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_left,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_right,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9
tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond,
tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1
BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_left,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_right,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_left,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_right,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_cond,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8
CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_x,
CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 t8_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 t8_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output,
 CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output,
 tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output,
 CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_7a01 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_2da4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_1e9e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_7e55_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_d7da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_55fb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_fd16 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_2205_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_8124_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_6532_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1413_l1405_l1410_DUPLICATE_f590_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_l1419_l1433_l1423_DUPLICATE_cf3a_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_ef2c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1442_l1400_DUPLICATE_f11b_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_fd16 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_fd16;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_2da4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_2da4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_d7da := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_d7da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_7a01 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_7a01;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_8a8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_deca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_1405] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_6532 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_6532_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_l1419_l1433_l1423_DUPLICATE_cf3a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_l1419_l1433_l1423_DUPLICATE_cf3a_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1435_c31_85c8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_return_output := CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_64b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_72ea] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_d8a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1417_c22_1e9e] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_1e9e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_8124 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_8124_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1413_l1405_l1410_DUPLICATE_f590 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1413_l1405_l1410_DUPLICATE_f590_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_96ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_8e30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_left;
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output := BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_77c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_ef2c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_ef2c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_3748] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_left;
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output := BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_77c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_96ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_64b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_8a8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_deca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_8e30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3748_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1405_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_1e9e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_ef2c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1424_l1428_DUPLICATE_ef2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1413_l1405_l1410_DUPLICATE_f590_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1413_l1405_l1410_DUPLICATE_f590_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1413_l1405_l1410_DUPLICATE_f590_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_6532_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_6532_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_6532_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1433_l1427_l1423_l1419_DUPLICATE_52a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_8124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_8124_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1405_l1419_l1410_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1413_l1410_l1437_l1405_l1433_l1423_l1419_DUPLICATE_2b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_l1419_l1433_l1423_DUPLICATE_cf3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_l1419_l1433_l1423_DUPLICATE_cf3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_l1419_l1433_l1423_DUPLICATE_cf3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_l1419_l1433_l1423_DUPLICATE_cf3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1413_l1410_l1405_l1433_l1423_l1419_DUPLICATE_b31b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_72ea_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_ed72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;

     -- t8_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1421_c22_7e55] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_7e55_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_d8a0_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_0acd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_dfce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_0642] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1435_c21_2205] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_2205_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_85c8_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1428_c3_6db1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_left;
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output := BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_0642] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1425_c3_65eb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_return_output := CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_7e55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_2205_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_65eb_return_output;
     VAR_printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_0acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_0642_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_0642_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     -- printf_uxn_opcodes_h_l1406_c3_0af4[uxn_opcodes_h_l1406_c3_0af4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1406_c3_0af4_uxn_opcodes_h_l1406_c3_0af4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_ed72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1427_c7_b5d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output := tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- t8_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     t8_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     t8_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := t8_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_b5d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_ed72] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output := result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_ed72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1431_c21_55fb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_55fb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_6db1_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_dfce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output := result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_55fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_ed72_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_b5d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- t8_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := t8_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1423_c7_fd99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_fd99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_b5d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_b5d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_b5d9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_fd99] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_fd99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1419_c7_dfce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_cond;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output := tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_dfce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_fd99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_fd99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_dfce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_dfce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_dfce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_dfce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_7ff8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_7ff8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_9293] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_9293_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_21b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1442_l1400_DUPLICATE_f11b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1442_l1400_DUPLICATE_f11b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5517(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_21b1_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1442_l1400_DUPLICATE_f11b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1442_l1400_DUPLICATE_f11b_return_output;
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
