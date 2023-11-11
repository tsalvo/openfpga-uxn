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
-- Submodules: 79
entity ora2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_f74041be;
architecture arch of ora2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l988_c6_202d]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_0a22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c2_3e59]
signal tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c2_3e59]
signal n16_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_3e59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_3e59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_3e59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_3e59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_3e59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c2_3e59]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c2_3e59]
signal t16_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l989_c3_1cf0[uxn_opcodes_h_l989_c3_1cf0]
signal printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_5e26]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal n16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l993_c7_ffb7]
signal t16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l996_c11_ae89]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c7_64d5]
signal tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c7_64d5]
signal n16_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_64d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_64d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_64d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_64d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_64d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l996_c7_64d5]
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c7_64d5]
signal t16_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_1bb5]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal n16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1001_c7_ba47]
signal t16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1002_c3_2781]
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1be3]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal n16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_3bab]
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_54ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1009_c7_5227]
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1009_c7_5227]
signal n16_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_5227]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_5227]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_5227]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_5227]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_5227]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_5227]
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1010_c3_1814]
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1011_c11_6036]
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1013_c30_8d3e]
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_f14b]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_ba2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_ba2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_ba2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_ba2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_ba2e]
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1021_c31_25b6]
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_a997]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_5d06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_5d06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d
BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c2_3e59
tmp16_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c2_3e59
n16_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
n16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
n16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
n16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59
result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c2_3e59
t16_MUX_uxn_opcodes_h_l988_c2_3e59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c2_3e59_cond,
t16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue,
t16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse,
t16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

-- printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0
printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0 : entity work.printf_uxn_opcodes_h_l989_c3_1cf0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26
BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output);

-- tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7
tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- n16_MUX_uxn_opcodes_h_l993_c7_ffb7
n16_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
n16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7
result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- t16_MUX_uxn_opcodes_h_l993_c7_ffb7
t16_MUX_uxn_opcodes_h_l993_c7_ffb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond,
t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue,
t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse,
t16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c7_64d5
tmp16_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c7_64d5
n16_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
n16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
n16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
n16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5
result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c7_64d5
t16_MUX_uxn_opcodes_h_l996_c7_64d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c7_64d5_cond,
t16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue,
t16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse,
t16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47
tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- n16_MUX_uxn_opcodes_h_l1001_c7_ba47
n16_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
n16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- t16_MUX_uxn_opcodes_h_l1001_c7_ba47
t16_MUX_uxn_opcodes_h_l1001_c7_ba47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond,
t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue,
t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse,
t16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781
BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_left,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_right,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab
tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- n16_MUX_uxn_opcodes_h_l1005_c7_3bab
n16_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
n16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1009_c7_5227
tmp16_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- n16_MUX_uxn_opcodes_h_l1009_c7_5227
n16_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
n16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
n16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
n16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_cond,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814
BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_left,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_right,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036
BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_left,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_right,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e
sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_ins,
sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_x,
sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_y,
sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6
CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_x,
CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 n16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 t16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output,
 tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 n16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 t16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 n16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 t16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 n16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 t16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 n16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 n16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output,
 sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output,
 CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_7183 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_2cfc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_3c62 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_702a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_0e0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_b3f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_aca8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_0dbd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_45ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_08d1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1028_l984_DUPLICATE_bbda_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_2cfc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_2cfc;
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_3c62 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_3c62;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_702a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_702a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_0e0b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_0e0b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_aca8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_aca8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_7183 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_7183;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_f14b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c11_ae89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_45ca LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_45ca_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_a997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_1bb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_1be3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l1021_c31_25b6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_return_output := CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_08d1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_08d1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_5e26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_54ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c6_202d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1013_c30_8d3e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_ins;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_x;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_return_output := sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_1bb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_1be3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_54ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_f14b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_a997_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_202d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_5e26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae89_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_45ca_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_45ca_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_45ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1009_DUPLICATE_f501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l1018_l1009_DUPLICATE_5007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_4308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l1023_l988_l1018_DUPLICATE_ecce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_08d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_08d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1005_l1001_l996_l993_l988_l1018_DUPLICATE_9d20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_8d3e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_ba2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1002_c3_2781] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_left;
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_return_output := BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_5d06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1010_c3_1814] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_left;
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output := BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_5d06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1021_c21_0dbd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_0dbd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_25b6_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_ba2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_0a22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_2781_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_1814_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_0dbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_0fc4_return_output;
     VAR_printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_0a22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5d06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_ba2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- t16_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := t16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_ba2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_ba2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1011_c11_6036] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_left;
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output := BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output;

     -- n16_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     n16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     n16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := n16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- printf_uxn_opcodes_h_l989_c3_1cf0[uxn_opcodes_h_l989_c3_1cf0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l989_c3_1cf0_uxn_opcodes_h_l989_c3_1cf0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_ba2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1016_c21_b3f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_b3f5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_6036_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     t16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := t16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- n16_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := n16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_b3f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- t16_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := t16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_5227] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_return_output := result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;

     -- n16_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := n16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_5227_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_t16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- n16_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     n16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := n16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_3bab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     t16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := t16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_3bab_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- n16_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := n16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_ba47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output := result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_n16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ba47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l996_c7_64d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- n16_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     n16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := n16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_64d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_ffb7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_ffb7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l988_c2_3e59] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1028_l984_DUPLICATE_bbda LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1028_l984_DUPLICATE_bbda_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_3e59_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_3e59_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1028_l984_DUPLICATE_bbda_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1028_l984_DUPLICATE_bbda_return_output;
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
