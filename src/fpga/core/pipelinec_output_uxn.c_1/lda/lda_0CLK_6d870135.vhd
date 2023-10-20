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
-- Submodules: 72
entity lda_0CLK_6d870135 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_6d870135;
architecture arch of lda_0CLK_6d870135 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_87fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1477_c2_b8ac]
signal t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_7473]
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1482_c7_c7b5]
signal t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_a828]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1485_c7_2c2d]
signal t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1487_c3_b2ad]
signal CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_2c78]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1490_c7_2694]
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_2694]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_2694]
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_2694]
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_2694]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_2694]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_2694]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_2694]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1490_c7_2694]
signal t16_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_2505]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1493_c7_2d9c]
signal t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1494_c3_d39a]
signal BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1496_c30_3c4d]
signal sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_3a52]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1499_c7_0903]
signal tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1499_c7_0903]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_0903]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_0903]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1499_c7_0903]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_0903]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_0903]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_7d29]
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1503_c7_bb62]
signal tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_bb62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1503_c7_bb62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_bb62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1503_c7_bb62]
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_8514]
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_ba75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_ba75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b7ce( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac
tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- t16_MUX_uxn_opcodes_h_l1477_c2_b8ac
t16_MUX_uxn_opcodes_h_l1477_c2_b8ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond,
t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue,
t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse,
t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_left,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_right,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5
tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- t16_MUX_uxn_opcodes_h_l1482_c7_c7b5
t16_MUX_uxn_opcodes_h_l1482_c7_c7b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond,
t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue,
t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse,
t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d
tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d
result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d
result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- t16_MUX_uxn_opcodes_h_l1485_c7_2c2d
t16_MUX_uxn_opcodes_h_l1485_c7_2c2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond,
t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue,
t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse,
t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad
CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_x,
CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1490_c7_2694
tmp8_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- t16_MUX_uxn_opcodes_h_l1490_c7_2694
t16_MUX_uxn_opcodes_h_l1490_c7_2694 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1490_c7_2694_cond,
t16_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue,
t16_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse,
t16_MUX_uxn_opcodes_h_l1490_c7_2694_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c
tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- t16_MUX_uxn_opcodes_h_l1493_c7_2d9c
t16_MUX_uxn_opcodes_h_l1493_c7_2d9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond,
t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue,
t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse,
t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a
BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_left,
BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_right,
BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d
sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_ins,
sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_x,
sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_y,
sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1499_c7_0903
tmp8_MUX_uxn_opcodes_h_l1499_c7_0903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_cond,
tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue,
tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse,
tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_left,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_right,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62
tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_cond,
tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue,
tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse,
tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_cond,
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_left,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_right,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output,
 tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output,
 tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output,
 tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output,
 tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 t16_MUX_uxn_opcodes_h_l1490_c7_2694_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output,
 tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output,
 tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output,
 tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_f4b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_c0c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_07c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_e5fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1506_c3_6664 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1494_l1486_DUPLICATE_9f02_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1499_l1503_l1493_DUPLICATE_202f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7ce_uxn_opcodes_h_l1514_l1472_DUPLICATE_9aea_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_07c7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1488_c3_07c7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_e5fd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_e5fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_c0c4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_c0c4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_f4b4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_f4b4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1506_c3_6664 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1506_c3_6664;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_7d29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_8514] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_left;
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output := BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_2505] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1499_l1503_l1493_DUPLICATE_202f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1499_l1503_l1493_DUPLICATE_202f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_87fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_3a52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_7473] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_left;
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output := BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1494_l1486_DUPLICATE_9f02 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1494_l1486_DUPLICATE_9f02_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1496_c30_3c4d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_ins;
     sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_x;
     sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_return_output := sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_a828] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_2c78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_87fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_7473_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_a828_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_2c78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_2505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_3a52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_7d29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_8514_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1494_l1486_DUPLICATE_9f02_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1494_l1486_DUPLICATE_9f02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1493_l1490_l1485_l1482_l1477_DUPLICATE_8bb1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_0e63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1503_DUPLICATE_202c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1499_l1490_l1485_l1482_l1477_DUPLICATE_9acb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1509_l1477_DUPLICATE_e332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1499_l1503_l1493_DUPLICATE_202f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1499_l1503_l1493_DUPLICATE_202f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1499_l1503_l1493_DUPLICATE_202f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1499_l1493_l1490_l1485_l1482_l1477_l1503_DUPLICATE_994a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1496_c30_3c4d_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1494_c3_d39a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_left;
     BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output := BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_0903] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_ba75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_0903] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1503_c7_bb62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output := result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1503_c7_bb62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_ba75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1487_c3_b2ad] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_return_output := CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1503_c7_bb62] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_cond;
     tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output := tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1494_c3_d39a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1487_c3_b2ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_ba75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1499_c7_0903] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_0903] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;

     -- t16_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1503_c7_bb62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1499_c7_0903] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_cond;
     tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_return_output := tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_bb62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1503_c7_bb62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     t16_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     t16_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := t16_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_0903] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1499_c7_0903] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c7_0903_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_2d9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_2d9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_2694] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;

     -- t16_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_2694_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_2c2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_2c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_c7b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c7b5_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_b8ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b7ce_uxn_opcodes_h_l1514_l1472_DUPLICATE_9aea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7ce_uxn_opcodes_h_l1514_l1472_DUPLICATE_9aea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b7ce(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1477_c2_b8ac_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7ce_uxn_opcodes_h_l1514_l1472_DUPLICATE_9aea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7ce_uxn_opcodes_h_l1514_l1472_DUPLICATE_9aea_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
