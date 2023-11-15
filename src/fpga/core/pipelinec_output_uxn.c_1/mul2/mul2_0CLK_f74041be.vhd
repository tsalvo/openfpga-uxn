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
entity mul2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_f74041be;
architecture arch of mul2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1898_c6_c381]
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1898_c1_76f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1898_c2_4734]
signal n16_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1898_c2_4734]
signal tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1898_c2_4734]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1898_c2_4734]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1898_c2_4734]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1898_c2_4734]
signal result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1898_c2_4734]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1898_c2_4734]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1898_c2_4734]
signal t16_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1899_c3_bd55[uxn_opcodes_h_l1899_c3_bd55]
signal printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_f37e]
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1903_c7_e9fd]
signal t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_4ade]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1906_c7_b819]
signal n16_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1906_c7_b819]
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_b819]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_b819]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c7_b819]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1906_c7_b819]
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_b819]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c7_b819]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1906_c7_b819]
signal t16_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_0dc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1911_c7_477d]
signal n16_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1911_c7_477d]
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_477d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_477d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_477d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_477d]
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_477d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_477d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1911_c7_477d]
signal t16_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1912_c3_656f]
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_a6d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1915_c7_0818]
signal n16_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1915_c7_0818]
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_0818]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_0818]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_0818]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1915_c7_0818]
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_0818]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1915_c7_0818]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_d99e]
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1919_c7_486b]
signal n16_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1919_c7_486b]
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_486b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_486b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_486b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_486b]
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_486b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_486b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1920_c3_bc71]
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1921_c11_0b5e]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1923_c30_2309]
signal sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1928_c11_b237]
signal BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1928_c7_6c27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1928_c7_6c27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1928_c7_6c27]
signal result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1928_c7_6c27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1928_c7_6c27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1931_c31_ed5b]
signal CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_a332]
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_c06d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_c06d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381
BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_left,
BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_right,
BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_return_output);

-- n16_MUX_uxn_opcodes_h_l1898_c2_4734
n16_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
n16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
n16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
n16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1898_c2_4734
tmp16_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734
result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734
result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734
result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- t16_MUX_uxn_opcodes_h_l1898_c2_4734
t16_MUX_uxn_opcodes_h_l1898_c2_4734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1898_c2_4734_cond,
t16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue,
t16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse,
t16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

-- printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55
printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55 : entity work.printf_uxn_opcodes_h_l1899_c3_bd55_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_left,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_right,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output);

-- n16_MUX_uxn_opcodes_h_l1903_c7_e9fd
n16_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd
tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- t16_MUX_uxn_opcodes_h_l1903_c7_e9fd
t16_MUX_uxn_opcodes_h_l1903_c7_e9fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond,
t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue,
t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse,
t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output);

-- n16_MUX_uxn_opcodes_h_l1906_c7_b819
n16_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
n16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
n16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
n16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1906_c7_b819
tmp16_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- t16_MUX_uxn_opcodes_h_l1906_c7_b819
t16_MUX_uxn_opcodes_h_l1906_c7_b819 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1906_c7_b819_cond,
t16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue,
t16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse,
t16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output);

-- n16_MUX_uxn_opcodes_h_l1911_c7_477d
n16_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
n16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
n16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
n16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1911_c7_477d
tmp16_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- t16_MUX_uxn_opcodes_h_l1911_c7_477d
t16_MUX_uxn_opcodes_h_l1911_c7_477d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1911_c7_477d_cond,
t16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue,
t16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse,
t16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f
BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_left,
BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_right,
BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output);

-- n16_MUX_uxn_opcodes_h_l1915_c7_0818
n16_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
n16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
n16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
n16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1915_c7_0818
tmp16_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_left,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_right,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output);

-- n16_MUX_uxn_opcodes_h_l1919_c7_486b
n16_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
n16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
n16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
n16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1919_c7_486b
tmp16_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71
BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_left,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_right,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1923_c30_2309
sp_relative_shift_uxn_opcodes_h_l1923_c30_2309 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_ins,
sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_x,
sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_y,
sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237
BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_left,
BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_right,
BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27
result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27
result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_cond,
result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27
result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27
result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b
CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_x,
CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_left,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_right,
BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78
CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_return_output,
 n16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 t16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output,
 n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output,
 n16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 t16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output,
 n16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 t16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output,
 n16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output,
 n16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output,
 CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_6d21 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_49ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_703c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_cbf5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1921_c3_3086 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1925_c3_1830 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1926_c21_2a76_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_b87e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1931_c21_5455_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1916_l1920_l1912_DUPLICATE_94b1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1928_l1915_DUPLICATE_dc74_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1938_l1894_DUPLICATE_9927_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_49ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_49ad;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1925_c3_1830 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1925_c3_1830;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_703c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_703c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_6d21 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_6d21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_cbf5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1913_c3_cbf5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_b87e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_b87e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_0dc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_4ade] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1928_c11_b237] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_left;
     BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output := BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1928_l1915_DUPLICATE_dc74 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1928_l1915_DUPLICATE_dc74_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1923_c30_2309] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_ins;
     sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_x;
     sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_return_output := sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1898_c6_c381] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_left;
     BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output := BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_d99e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1915_c11_a6d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_f37e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1931_c31_ed5b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_return_output := CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1933_c11_a332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_left;
     BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output := BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1916_l1920_l1912_DUPLICATE_94b1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1916_l1920_l1912_DUPLICATE_94b1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1898_c6_c381_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_f37e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_4ade_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_0dc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1915_c11_a6d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_d99e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1928_c11_b237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c11_a332_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1916_l1920_l1912_DUPLICATE_94b1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1916_l1920_l1912_DUPLICATE_94b1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1916_l1920_l1912_DUPLICATE_94b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1919_l1915_DUPLICATE_02df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1928_l1919_l1915_DUPLICATE_5431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_b0df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1933_l1898_l1928_l1915_DUPLICATE_fe8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1928_l1915_DUPLICATE_dc74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1928_l1915_DUPLICATE_dc74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1911_l1906_l1903_l1898_l1928_l1915_DUPLICATE_3506_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1923_c30_2309_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c7_c06d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1928_c7_6c27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1928_c7_6c27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1912_c3_656f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_left;
     BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_return_output := BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c7_c06d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1931_c21_5455] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1931_c21_5455_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1931_c31_ed5b_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1898_c1_76f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1920_c3_bc71] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_left;
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output := BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_656f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_bc71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1931_c21_5455_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1917_l1908_DUPLICATE_2b78_return_output;
     VAR_printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1898_c1_76f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c7_c06d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1928_c7_6c27] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output := result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     n16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     n16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := n16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- printf_uxn_opcodes_h_l1899_c3_bd55[uxn_opcodes_h_l1899_c3_bd55] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1899_c3_bd55_uxn_opcodes_h_l1899_c3_bd55_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1928_c7_6c27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1921_c11_0b5e] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     t16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     t16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := t16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1928_c7_6c27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1921_c3_3086 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1921_c11_0b5e_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1928_c7_6c27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := VAR_tmp16_uxn_opcodes_h_l1921_c3_3086;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     n16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     n16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := n16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     t16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     t16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := t16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1926_c21_2a76] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1926_c21_2a76_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1921_c3_3086);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1926_c21_2a76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_486b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- n16_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     n16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     n16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := n16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_486b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     n16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     n16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := n16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     t16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     t16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := t16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1915_c7_0818] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_return_output := result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1915_c7_0818_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_477d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- n16_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_477d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1906_c7_b819] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_return_output := result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     n16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     n16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := n16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c7_b819_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1903_c7_e9fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_e9fd_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1898_c2_4734] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_return_output := result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1938_l1894_DUPLICATE_9927 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1938_l1894_DUPLICATE_9927_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1898_c2_4734_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1898_c2_4734_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1938_l1894_DUPLICATE_9927_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1938_l1894_DUPLICATE_9927_return_output;
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
