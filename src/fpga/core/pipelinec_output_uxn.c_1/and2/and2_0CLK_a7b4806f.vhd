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
-- Submodules: 107
entity and2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_a7b4806f;
architecture arch of and2_0CLK_a7b4806f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l983_c6_0d2f]
signal BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l983_c1_ebc3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l983_c2_27d0]
signal n16_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l983_c2_27d0]
signal tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c2_27d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c2_27d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l983_c2_27d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l983_c2_27d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l983_c2_27d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l983_c2_27d0]
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l983_c2_27d0]
signal t16_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l984_c3_af9a[uxn_opcodes_h_l984_c3_af9a]
signal printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l988_c11_9fea]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c7_5958]
signal n16_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c7_5958]
signal tmp16_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_5958]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_5958]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_5958]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_5958]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_5958]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c7_5958]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c7_5958]
signal t16_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_6af9]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_b470]
signal n16_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l991_c7_b470]
signal tmp16_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_b470]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_b470]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_b470]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_b470]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_b470]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l991_c7_b470]
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l991_c7_b470]
signal t16_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l996_c11_edf7]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c7_3a68]
signal n16_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c7_3a68]
signal tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_3a68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_3a68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_3a68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_3a68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_3a68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l996_c7_3a68]
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c7_3a68]
signal t16_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l999_c11_6f7b]
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l999_c7_cde8]
signal n16_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l999_c7_cde8]
signal tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_cde8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_cde8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_cde8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_cde8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_cde8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l999_c7_cde8]
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l999_c7_cde8]
signal t16_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1000_c3_884c]
signal BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_9e6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal n16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1003_c7_23fe]
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_22ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1006_c7_7ff3]
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_e514]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1011_c7_672a]
signal n16_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1011_c7_672a]
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1011_c7_672a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1011_c7_672a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1011_c7_672a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_672a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_672a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1011_c7_672a]
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_0896]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1014_c7_0b9a]
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1015_c3_9a27]
signal BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1016_c11_9662]
signal BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1018_c30_36db]
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_ea79]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_2622]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_2622]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_2622]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_2622]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1023_c7_2622]
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1026_c31_23d1]
signal CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_5aa2]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_9b77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_9b77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_left,
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_right,
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_return_output);

-- n16_MUX_uxn_opcodes_h_l983_c2_27d0
n16_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
n16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
n16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
n16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l983_c2_27d0
tmp16_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0
result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- t16_MUX_uxn_opcodes_h_l983_c2_27d0
t16_MUX_uxn_opcodes_h_l983_c2_27d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l983_c2_27d0_cond,
t16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue,
t16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse,
t16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

-- printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a
printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a : entity work.printf_uxn_opcodes_h_l984_c3_af9a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea
BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c7_5958
n16_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c7_5958_cond,
n16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
n16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
n16_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c7_5958
tmp16_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c7_5958_cond,
tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958
result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c7_5958
t16_MUX_uxn_opcodes_h_l988_c7_5958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c7_5958_cond,
t16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue,
t16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse,
t16_MUX_uxn_opcodes_h_l988_c7_5958_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9
BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_b470
n16_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_b470_cond,
n16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- tmp16_MUX_uxn_opcodes_h_l991_c7_b470
tmp16_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l991_c7_b470_cond,
tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
tmp16_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470
result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_cond,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- t16_MUX_uxn_opcodes_h_l991_c7_b470
t16_MUX_uxn_opcodes_h_l991_c7_b470 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l991_c7_b470_cond,
t16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue,
t16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse,
t16_MUX_uxn_opcodes_h_l991_c7_b470_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7
BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c7_3a68
n16_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
n16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
n16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
n16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c7_3a68
tmp16_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68
result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c7_3a68
t16_MUX_uxn_opcodes_h_l996_c7_3a68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c7_3a68_cond,
t16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue,
t16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse,
t16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b
BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_left,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_right,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output);

-- n16_MUX_uxn_opcodes_h_l999_c7_cde8
n16_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
n16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
n16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
n16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l999_c7_cde8
tmp16_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8
result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- t16_MUX_uxn_opcodes_h_l999_c7_cde8
t16_MUX_uxn_opcodes_h_l999_c7_cde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l999_c7_cde8_cond,
t16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue,
t16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse,
t16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c
BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_left,
BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_right,
BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output);

-- n16_MUX_uxn_opcodes_h_l1003_c7_23fe
n16_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
n16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe
tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output);

-- n16_MUX_uxn_opcodes_h_l1006_c7_7ff3
n16_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3
tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output);

-- n16_MUX_uxn_opcodes_h_l1011_c7_672a
n16_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
n16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
n16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
n16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1011_c7_672a
tmp16_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output);

-- n16_MUX_uxn_opcodes_h_l1014_c7_0b9a
n16_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a
tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27
BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_left,
BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_right,
BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662
BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_left,
BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_right,
BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1018_c30_36db
sp_relative_shift_uxn_opcodes_h_l1018_c30_36db : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_ins,
sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_x,
sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_y,
sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_cond,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1
CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_x,
CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380
CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_return_output,
 n16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 t16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output,
 n16_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 t16_MUX_uxn_opcodes_h_l988_c7_5958_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 tmp16_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 t16_MUX_uxn_opcodes_h_l991_c7_b470_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output,
 n16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 t16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output,
 n16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 t16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output,
 n16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output,
 n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output,
 n16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output,
 n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output,
 sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_return_output,
 CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_d3fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_eece : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_2965 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_cba9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_ba51 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_6323 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_6451 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_6401 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_0122 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_8d5b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_ac2c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_c7_2622_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_1a49_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1007_l1000_l992_l1015_DUPLICATE_a1e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1033_l979_DUPLICATE_d5f0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_6451 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_6451;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_6323 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_6323;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_2965 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_2965;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_0122 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_0122;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_d3fe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_d3fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_6401 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_6401;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_cba9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_cba9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_ba51 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_ba51;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_eece := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_eece;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_ac2c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_ac2c;
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_y := resize(to_signed(-2, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_5aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_6af9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1023_c7_2622] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_c7_2622_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1018_c30_36db] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_ins;
     sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_x;
     sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_return_output := sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l999_c11_6f7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_0896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_9e6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1026_c31_23d1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_return_output := CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_e514] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1007_l1000_l992_l1015_DUPLICATE_a1e0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1007_l1000_l992_l1015_DUPLICATE_a1e0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c11_edf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c11_9fea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_22ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l983_c6_0d2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_ea79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_9e6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_22ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_e514_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_0896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_ea79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_5aa2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0d2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_9fea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_6af9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_edf7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_6f7b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1007_l1000_l992_l1015_DUPLICATE_a1e0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1007_l1000_l992_l1015_DUPLICATE_a1e0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1007_l1000_l992_l1015_DUPLICATE_a1e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l991_l1014_l988_l1011_DUPLICATE_864a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1006_l1003_l999_l1028_l996_l1023_l991_l1014_l988_l1011_DUPLICATE_85d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_65cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l1028_l996_l1023_l991_l988_l1011_DUPLICATE_968f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l983_l1006_l1003_l999_l996_l1023_l991_l988_l1011_DUPLICATE_8cbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_c7_2622_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_36db_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l983_c1_ebc3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_9b77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_2622] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1026_c21_1a49] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_1a49_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_23d1_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1015_c3_9a27] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_left;
     BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output := BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_2622] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1000_c3_884c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_left;
     BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_return_output := BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_9b77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_884c_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_9a27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_1a49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1008_l993_DUPLICATE_3380_return_output;
     VAR_printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_ebc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_9b77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_2622] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;

     -- t16_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     t16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     t16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := t16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1023_c7_2622] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_return_output := result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_2622] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- printf_uxn_opcodes_h_l984_c3_af9a[uxn_opcodes_h_l984_c3_af9a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l984_c3_af9a_uxn_opcodes_h_l984_c3_af9a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_AND[uxn_opcodes_h_l1016_c11_9662] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_left;
     BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output := BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_2622_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_t16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     t16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := t16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     n16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     n16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := n16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1021_c21_8d5b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_8d5b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_9662_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_8d5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_t16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1014_c7_0b9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- t16_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     t16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     t16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_return_output := t16_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_0b9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_t16_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     t16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_return_output := t16_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := n16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1011_c7_672a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_672a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     n16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     n16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := n16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- t16_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     t16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     t16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := t16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1006_c7_7ff3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_n16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_7ff3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- n16_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     n16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := n16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1003_c7_23fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_n16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_23fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- n16_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_return_output := n16_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l999_c7_cde8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_return_output := result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_cde8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     -- n16_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     n16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_return_output := n16_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l996_c7_3a68] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_cond;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_return_output := result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_return_output := tmp16_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_3a68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_return_output := tmp16_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- n16_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     n16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     n16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := n16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l991_c7_b470] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_cond;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_return_output := result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_b470_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l988_c7_5958] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_5958_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l983_c2_27d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1033_l979_DUPLICATE_d5f0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1033_l979_DUPLICATE_d5f0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_27d0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_27d0_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1033_l979_DUPLICATE_d5f0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1033_l979_DUPLICATE_d5f0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
