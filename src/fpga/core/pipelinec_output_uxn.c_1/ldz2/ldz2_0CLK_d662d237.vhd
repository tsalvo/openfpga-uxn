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
-- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_e1a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_c199]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal t8_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1405_c2_7f12]
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1406_c3_ad7e[uxn_opcodes_h_l1406_c3_ad7e]
signal printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_6788]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1410_c7_474c]
signal t8_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_474c]
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_474c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_474c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_474c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_474c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_474c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_474c]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1410_c7_474c]
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_4296]
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1413_c7_4403]
signal t8_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_4403]
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_4403]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_4403]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_4403]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_4403]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_4403]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_4403]
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1413_c7_4403]
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_2f0f]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_5d32]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_4e82]
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_4e82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_4e82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_4e82]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_4e82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_4e82]
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1419_c7_4e82]
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_24a6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_e050]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_df10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_df10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_df10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_df10]
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c7_df10]
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1425_c3_4b80]
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_7f45]
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_3e47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_3e47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_3e47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_3e47]
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1427_c7_3e47]
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1428_c3_dc5d]
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_3189]
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_6641]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_6641]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_6641]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_6641]
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1435_c31_4749]
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_8c12]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_ed1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_ed1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_return_output);

-- t8_MUX_uxn_opcodes_h_l1405_c2_7f12
t8_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
t8_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12
tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_cond,
tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue,
tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse,
tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

-- printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e
printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e : entity work.printf_uxn_opcodes_h_l1406_c3_ad7e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output);

-- t8_MUX_uxn_opcodes_h_l1410_c7_474c
t8_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
t8_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
t8_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
t8_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1410_c7_474c
tmp16_MUX_uxn_opcodes_h_l1410_c7_474c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_cond,
tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_left,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_right,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output);

-- t8_MUX_uxn_opcodes_h_l1413_c7_4403
t8_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
t8_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
t8_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
t8_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1413_c7_4403
tmp16_MUX_uxn_opcodes_h_l1413_c7_4403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_cond,
tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue,
tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse,
tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f
sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82
tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_cond,
tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue,
tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse,
tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_cond,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c7_df10
tmp16_MUX_uxn_opcodes_h_l1423_c7_df10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80
CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_x,
CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_left,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_right,
BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_cond,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47
tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_cond,
tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue,
tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse,
tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d
BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_left,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_right,
BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_left,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_right,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_cond,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1435_c31_4749
CONST_SR_8_uxn_opcodes_h_l1435_c31_4749 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_x,
CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_return_output,
 t8_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output,
 t8_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output,
 t8_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output,
 tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_return_output,
 CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output,
 tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_return_output,
 CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_6c39 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_81b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_c958_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_d442_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_b0e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_203e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_9386 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_a880_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_9cae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_70a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_6727_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_107c_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_b304_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1442_l1400_DUPLICATE_18fb_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_9386 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_9386;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_81b0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_81b0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_6c39 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_6c39;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_b0e8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1430_c3_b0e8;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c11_5d32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_4296] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_left;
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output := BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_70a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_70a8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1427_c11_7f45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_107c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_107c_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_2f0f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_b304 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_b304_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_3189] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_left;
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output := BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1421_c33_24a6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_e050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_e1a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1417_c22_c958] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_c958_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_9cae LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_9cae_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_6727 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_6727_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_6788] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1435_c31_4749] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_return_output := CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_8c12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_e1a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_6788_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_4296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c11_5d32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_e050_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1427_c11_7f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8c12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1417_c22_c958_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_b304_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1428_l1424_DUPLICATE_b304_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_6727_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_6727_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_6727_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_9cae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_9cae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_9cae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1433_l1427_l1423_l1419_l1413_l1410_l1437_DUPLICATE_3203_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_70a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_70a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1419_l1410_l1405_DUPLICATE_70a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1437_l1405_DUPLICATE_abc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_107c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_107c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_107c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1419_l1433_l1423_l1413_DUPLICATE_107c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1433_l1423_l1419_l1413_l1410_l1405_DUPLICATE_281c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_2f0f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1428_c3_dc5d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_left;
     BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output := BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1435_c21_a880] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_a880_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1435_c31_4749_return_output);

     -- t8_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     t8_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     t8_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := t8_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_ed1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_ed1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1419_c7_4e82] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1421_c22_d442] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_d442_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c33_24a6_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1425_c3_4b80] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_return_output := CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_6641] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1405_c1_c199] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1421_c22_d442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1435_c21_a880_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_4b80_return_output;
     VAR_printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1405_c1_c199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_ed1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_6641] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_return_output := result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_6641] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1427_c7_3e47] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_cond;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output := tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1427_c7_3e47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;

     -- t8_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     t8_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     t8_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := t8_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- printf_uxn_opcodes_h_l1406_c3_ad7e[uxn_opcodes_h_l1406_c3_ad7e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1406_c3_ad7e_uxn_opcodes_h_l1406_c3_ad7e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1431_c21_203e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_203e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1428_c3_dc5d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_6641] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1419_c7_4e82] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output := result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1431_c21_203e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_6641_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_df10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1427_c7_3e47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output := result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1427_c7_3e47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- t8_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := t8_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1423_c7_df10] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1427_c7_3e47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1427_c7_3e47_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1419_c7_4e82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_df10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_df10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1419_c7_4e82] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_cond;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output := tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1423_c7_df10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_return_output := result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1423_c7_df10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1419_c7_4e82] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output := result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1419_c7_4e82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1419_c7_4e82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1419_c7_4e82_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_4403] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_4403_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_474c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_474c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_7f12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1442_l1400_DUPLICATE_18fb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1442_l1400_DUPLICATE_18fb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_7f12_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1442_l1400_DUPLICATE_18fb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1442_l1400_DUPLICATE_18fb_return_output;
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
