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
-- BIN_OP_EQ[uxn_opcodes_h_l988_c6_55ee]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_f0c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c2_d47d]
signal t16_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c2_d47d]
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_d47d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_d47d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_d47d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_d47d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c2_d47d]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_d47d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c2_d47d]
signal n16_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l989_c3_3025[uxn_opcodes_h_l989_c3_3025]
signal printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_ff06]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l993_c7_398e]
signal t16_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l993_c7_398e]
signal tmp16_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_398e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_398e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_398e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_398e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_398e]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_398e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l993_c7_398e]
signal n16_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l996_c11_5c73]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c7_2439]
signal t16_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c7_2439]
signal tmp16_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_2439]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_2439]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_2439]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_2439]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l996_c7_2439]
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_2439]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c7_2439]
signal n16_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_839f]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1001_c7_c4a6]
signal n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_47af]
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1004_c7_f2bb]
signal n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1005_c3_cf52]
signal BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_a080]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1008_c7_bcce]
signal n16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_c990]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1011_c7_d787]
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1011_c7_d787]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1011_c7_d787]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_d787]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_d787]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1011_c7_d787]
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1011_c7_d787]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1011_c7_d787]
signal n16_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_2157]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1016_c7_8eef]
signal n16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_b006]
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1019_c7_a54f]
signal n16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1020_c3_5067]
signal BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1021_c11_9c06]
signal BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1023_c30_d887]
signal sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_f6f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_bb81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_bb81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_bb81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_bb81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1028_c7_bb81]
signal result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1031_c31_261f]
signal CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_811c]
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_14f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_14f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee
BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c2_d47d
t16_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
t16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
t16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
t16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c2_d47d
tmp16_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c2_d47d
n16_MUX_uxn_opcodes_h_l988_c2_d47d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c2_d47d_cond,
n16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue,
n16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse,
n16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

-- printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025
printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025 : entity work.printf_uxn_opcodes_h_l989_c3_3025_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06
BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output);

-- t16_MUX_uxn_opcodes_h_l993_c7_398e
t16_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l993_c7_398e_cond,
t16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
t16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
t16_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l993_c7_398e
tmp16_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l993_c7_398e_cond,
tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
tmp16_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e
result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- n16_MUX_uxn_opcodes_h_l993_c7_398e
n16_MUX_uxn_opcodes_h_l993_c7_398e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l993_c7_398e_cond,
n16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue,
n16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse,
n16_MUX_uxn_opcodes_h_l993_c7_398e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c7_2439
t16_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c7_2439_cond,
t16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
t16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
t16_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c7_2439
tmp16_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c7_2439_cond,
tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439
result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_cond,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c7_2439
n16_MUX_uxn_opcodes_h_l996_c7_2439 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c7_2439_cond,
n16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue,
n16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse,
n16_MUX_uxn_opcodes_h_l996_c7_2439_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output);

-- t16_MUX_uxn_opcodes_h_l1001_c7_c4a6
t16_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6
tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1001_c7_c4a6
n16_MUX_uxn_opcodes_h_l1001_c7_c4a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond,
n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue,
n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse,
n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_left,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_right,
BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output);

-- t16_MUX_uxn_opcodes_h_l1004_c7_f2bb
t16_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb
tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb
result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- n16_MUX_uxn_opcodes_h_l1004_c7_f2bb
n16_MUX_uxn_opcodes_h_l1004_c7_f2bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond,
n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue,
n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse,
n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52
BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_left,
BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_right,
BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce
tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce
result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- n16_MUX_uxn_opcodes_h_l1008_c7_bcce
n16_MUX_uxn_opcodes_h_l1008_c7_bcce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond,
n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue,
n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse,
n16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1011_c7_d787
tmp16_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- n16_MUX_uxn_opcodes_h_l1011_c7_d787
n16_MUX_uxn_opcodes_h_l1011_c7_d787 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1011_c7_d787_cond,
n16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue,
n16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse,
n16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef
tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef
result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- n16_MUX_uxn_opcodes_h_l1016_c7_8eef
n16_MUX_uxn_opcodes_h_l1016_c7_8eef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond,
n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue,
n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse,
n16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_left,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_right,
BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f
tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f
result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- n16_MUX_uxn_opcodes_h_l1019_c7_a54f
n16_MUX_uxn_opcodes_h_l1019_c7_a54f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond,
n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue,
n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse,
n16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067
BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_left,
BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_right,
BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06
BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_left,
BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_right,
BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1023_c30_d887
sp_relative_shift_uxn_opcodes_h_l1023_c30_d887 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_ins,
sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_x,
sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_y,
sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81
result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_cond,
result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1031_c31_261f
CONST_SR_8_uxn_opcodes_h_l1031_c31_261f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_x,
CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_left,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_right,
BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82
CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_return_output,
 t16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 n16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output,
 t16_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 tmp16_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 n16_MUX_uxn_opcodes_h_l993_c7_398e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output,
 t16_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 n16_MUX_uxn_opcodes_h_l996_c7_2439_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output,
 t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output,
 t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output,
 tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 n16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output,
 tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 n16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output,
 tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 n16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output,
 tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 n16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output,
 sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output,
 CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_d3db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_8bf3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_5360 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_0eac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_eb4d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_d95c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_62f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_2b4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_36a3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_2cea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1030_c3_1a05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_c7_bb81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1031_c21_3cea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1005_l1020_l1012_l997_DUPLICATE_20dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l984_l1038_DUPLICATE_2b76_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_36a3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_36a3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_eb4d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_eb4d;
     VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_8bf3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_8bf3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1030_c3_1a05 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1030_c3_1a05;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_d95c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_d95c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_d3db := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_d3db;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_2b4e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_2b4e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_0eac := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_0eac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_5360 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_5360;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_62f6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_62f6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1028_c7_bb81] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_c7_bb81_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_ff06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c11_5c73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_f6f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c6_55ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1031_c31_261f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_return_output := CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_c990] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1019_c11_b006] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_left;
     BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output := BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1033_c11_811c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_839f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_2157] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1023_c30_d887] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_ins;
     sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_x;
     sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_return_output := sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_a080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1005_l1020_l1012_l997_DUPLICATE_20dd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1005_l1020_l1012_l997_DUPLICATE_20dd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1004_c11_47af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_839f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1004_c11_47af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_a080_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_c990_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_2157_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1019_c11_b006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f6f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1033_c11_811c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_55ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_ff06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_5c73_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1005_l1020_l1012_l997_DUPLICATE_20dd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1005_l1020_l1012_l997_DUPLICATE_20dd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1005_l1020_l1012_l997_DUPLICATE_20dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l996_l1019_l993_l1016_l988_DUPLICATE_622d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l1019_l993_l1016_DUPLICATE_8656_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_5d69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1033_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_b19d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1011_l1008_l1004_l1001_l1028_l996_l993_l1016_l988_DUPLICATE_3c8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1028_c7_bb81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1023_c30_d887_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1033_c7_14f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1031_c21_3cea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1031_c21_3cea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1031_c31_261f_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1005_c3_cf52] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_left;
     BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_return_output := BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_bb81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1033_c7_14f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1020_c3_5067] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_left;
     BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output := BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_bb81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_f0c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1005_c3_cf52_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1020_c3_5067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1031_c21_3cea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l998_l1013_DUPLICATE_4e82_return_output;
     VAR_printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_f0c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1033_c7_14f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;
     -- n16_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := n16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_bb81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_bb81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1021_c11_9c06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_left;
     BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output := BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- printf_uxn_opcodes_h_l989_c3_3025[uxn_opcodes_h_l989_c3_3025] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l989_c3_3025_uxn_opcodes_h_l989_c3_3025_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1028_c7_bb81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output := result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1028_c7_bb81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1026_c21_2cea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_2cea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l1021_c11_9c06_return_output);

     -- t16_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := n16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_2cea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     n16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     n16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := n16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1019_c7_a54f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     t16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_return_output := t16_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1019_c7_a54f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1016_c7_8eef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- t16_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     t16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     t16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_return_output := t16_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := n16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1016_c7_8eef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     -- n16_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     t16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := t16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1011_c7_d787] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_return_output := result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_d787_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1008_c7_bcce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output := result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1008_c7_bcce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1004_c7_f2bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- n16_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     n16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_return_output := n16_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1004_c7_f2bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_return_output := tmp16_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- n16_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     n16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     n16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_return_output := n16_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_c4a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_c4a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l996_c7_2439] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_cond;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_return_output := result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_return_output := tmp16_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- n16_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     n16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := n16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_2439_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_398e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_398e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l988_c2_d47d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l984_l1038_DUPLICATE_2b76 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l984_l1038_DUPLICATE_2b76_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d47d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d47d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l984_l1038_DUPLICATE_2b76_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l984_l1038_DUPLICATE_2b76_return_output;
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
