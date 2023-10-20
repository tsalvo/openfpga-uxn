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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 63
entity inc2_0CLK_e5505ae3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_e5505ae3;
architecture arch of inc2_0CLK_e5505ae3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1434_c6_b790]
signal BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1434_c2_2156]
signal tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1434_c2_2156]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1434_c2_2156]
signal result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1434_c2_2156]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1434_c2_2156]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1434_c2_2156]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1434_c2_2156]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1434_c2_2156]
signal t16_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_f451]
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1439_c7_c64a]
signal t16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_547b]
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1442_c7_6deb]
signal t16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1444_c3_f5ef]
signal CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_a424]
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1447_c7_78b2]
signal t16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_a23e]
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1450_c7_870d]
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_870d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1450_c7_870d]
signal result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_870d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_870d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_870d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_870d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1450_c7_870d]
signal t16_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1451_c3_c770]
signal BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1452_c11_e01f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1454_c30_251a]
signal sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1459_c11_0c61]
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1459_c7_1c7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1459_c7_1c7a]
signal result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1459_c7_1c7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1459_c7_1c7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1459_c7_1c7a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1462_c31_d96f]
signal CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1464_c11_77f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c7_167d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c7_167d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790
BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_left,
BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_right,
BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1434_c2_2156
tmp16_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156
result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156
result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156
result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156
result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156
result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- t16_MUX_uxn_opcodes_h_l1434_c2_2156
t16_MUX_uxn_opcodes_h_l1434_c2_2156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1434_c2_2156_cond,
t16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue,
t16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse,
t16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_left,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_right,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a
tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- t16_MUX_uxn_opcodes_h_l1439_c7_c64a
t16_MUX_uxn_opcodes_h_l1439_c7_c64a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond,
t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue,
t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse,
t16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_left,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_right,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb
tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- t16_MUX_uxn_opcodes_h_l1442_c7_6deb
t16_MUX_uxn_opcodes_h_l1442_c7_6deb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond,
t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue,
t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse,
t16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef
CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_x,
CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_left,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_right,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2
tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- t16_MUX_uxn_opcodes_h_l1447_c7_78b2
t16_MUX_uxn_opcodes_h_l1447_c7_78b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond,
t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue,
t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse,
t16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_left,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_right,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1450_c7_870d
tmp16_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d
result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- t16_MUX_uxn_opcodes_h_l1450_c7_870d
t16_MUX_uxn_opcodes_h_l1450_c7_870d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1450_c7_870d_cond,
t16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue,
t16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse,
t16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770
BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_left,
BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_right,
BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f
BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1454_c30_251a
sp_relative_shift_uxn_opcodes_h_l1454_c30_251a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_ins,
sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_x,
sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_y,
sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_left,
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_right,
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a
result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f
CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_x,
CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output,
 tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 t16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output,
 tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 t16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 t16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output,
 CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output,
 tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 t16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 t16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1436_c3_0e7a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1440_c3_afd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_4fae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_fac9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1452_c3_9491 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1456_c3_71c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1457_c21_ee14_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1461_c3_0535 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1459_c7_1c7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1462_c21_c6fd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1451_DUPLICATE_6154_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1469_l1430_DUPLICATE_c216_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_4fae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_4fae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_fac9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_fac9;
     VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1461_c3_0535 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1461_c3_0535;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1436_c3_0e7a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1436_c3_0e7a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1440_c3_afd2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1440_c3_afd2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1456_c3_71c6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1456_c3_71c6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_547b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_a23e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1459_c7_1c7a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1459_c7_1c7a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_f451] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_left;
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output := BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1454_c30_251a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_ins;
     sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_x;
     sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_return_output := sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1451_DUPLICATE_6154 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1451_DUPLICATE_6154_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1464_c11_77f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1434_c6_b790] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_left;
     BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output := BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_a424] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_left;
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output := BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1459_c11_0c61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_left;
     BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output := BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1462_c31_d96f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_return_output := CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1434_c6_b790_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_f451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_547b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_a424_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a23e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_0c61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_77f7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1451_DUPLICATE_6154_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1451_DUPLICATE_6154_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1434_l1450_l1447_l1442_l1439_DUPLICATE_75f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1464_l1459_l1450_l1447_l1442_l1439_DUPLICATE_d193_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_81a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1434_l1464_l1459_l1447_l1442_l1439_DUPLICATE_32ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1434_l1459_l1447_l1442_l1439_DUPLICATE_75ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1459_c7_1c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1454_c30_251a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1451_c3_c770] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_left;
     BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output := BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1444_c3_f5ef] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_return_output := CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1462_c21_c6fd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1462_c21_c6fd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1462_c31_d96f_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c7_167d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1459_c7_1c7a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1459_c7_1c7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c7_167d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_c770_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1462_c21_c6fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1444_c3_f5ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_167d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_167d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1459_c7_1c7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1459_c7_1c7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1459_c7_1c7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     t16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     t16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := t16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1452_c11_e01f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1452_c3_9491 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1452_c11_e01f_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1459_c7_1c7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := VAR_tmp16_uxn_opcodes_h_l1452_c3_9491;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := t16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1457_c21_ee14] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1457_c21_ee14_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1452_c3_9491);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1457_c21_ee14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := t16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1450_c7_870d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1450_c7_870d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := t16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1447_c7_78b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c7_78b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- t16_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     t16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     t16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := t16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1442_c7_6deb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_6deb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1439_c7_c64a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1439_c7_c64a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1434_c2_2156] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_return_output := result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1469_l1430_DUPLICATE_c216 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1469_l1430_DUPLICATE_c216_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1434_c2_2156_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1469_l1430_DUPLICATE_c216_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1469_l1430_DUPLICATE_c216_return_output;
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
