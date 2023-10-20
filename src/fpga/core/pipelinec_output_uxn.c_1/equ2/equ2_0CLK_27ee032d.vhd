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
-- Submodules: 89
entity equ2_0CLK_27ee032d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_27ee032d;
architecture arch of equ2_0CLK_27ee032d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1265_c6_9e5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal n16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1265_c2_16b5]
signal t16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_3c4d]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1270_c7_543a]
signal n16_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_543a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_543a]
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_543a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_543a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_543a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_543a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1270_c7_543a]
signal t16_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1273_c11_3bb5]
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1273_c7_1ac7]
signal t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_692f]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal n16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1278_c7_2c50]
signal t16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_cb7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1281_c7_661d]
signal n16_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_661d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1281_c7_661d]
signal result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_661d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_661d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_661d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_661d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1281_c7_661d]
signal t16_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1282_c3_b76a]
signal BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_16bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1285_c7_0553]
signal n16_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_0553]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1285_c7_0553]
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_0553]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_0553]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_0553]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_0553]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1288_c11_7284]
signal BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1288_c7_795d]
signal n16_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1288_c7_795d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1288_c7_795d]
signal result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1288_c7_795d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1288_c7_795d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1288_c7_795d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1288_c7_795d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_8efa]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_c9d5]
signal n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_c9d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_c9d5]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_c9d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_c9d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_c9d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_c9d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_1330]
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1296_c7_ec33]
signal n16_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_ec33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1296_c7_ec33]
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_ec33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_ec33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_ec33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_ec33]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1297_c3_d14a]
signal BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1299_c30_7492]
signal sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c21_f3f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1302_c21_d18d]
signal MUX_uxn_opcodes_h_l1302_c21_d18d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1302_c21_d18d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1302_c21_d18d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1302_c21_d18d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_beea]
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_cc80]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_cc80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_cc80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e
BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output);

-- n16_MUX_uxn_opcodes_h_l1265_c2_16b5
n16_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
n16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5
result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- t16_MUX_uxn_opcodes_h_l1265_c2_16b5
t16_MUX_uxn_opcodes_h_l1265_c2_16b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond,
t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue,
t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse,
t16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output);

-- n16_MUX_uxn_opcodes_h_l1270_c7_543a
n16_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
n16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
n16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
n16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- t16_MUX_uxn_opcodes_h_l1270_c7_543a
t16_MUX_uxn_opcodes_h_l1270_c7_543a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1270_c7_543a_cond,
t16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue,
t16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse,
t16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_left,
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_right,
BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output);

-- n16_MUX_uxn_opcodes_h_l1273_c7_1ac7
n16_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7
result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- t16_MUX_uxn_opcodes_h_l1273_c7_1ac7
t16_MUX_uxn_opcodes_h_l1273_c7_1ac7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond,
t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue,
t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse,
t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output);

-- n16_MUX_uxn_opcodes_h_l1278_c7_2c50
n16_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
n16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- t16_MUX_uxn_opcodes_h_l1278_c7_2c50
t16_MUX_uxn_opcodes_h_l1278_c7_2c50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond,
t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue,
t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse,
t16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output);

-- n16_MUX_uxn_opcodes_h_l1281_c7_661d
n16_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
n16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
n16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
n16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d
result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- t16_MUX_uxn_opcodes_h_l1281_c7_661d
t16_MUX_uxn_opcodes_h_l1281_c7_661d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1281_c7_661d_cond,
t16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue,
t16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse,
t16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a
BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_left,
BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_right,
BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output);

-- n16_MUX_uxn_opcodes_h_l1285_c7_0553
n16_MUX_uxn_opcodes_h_l1285_c7_0553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1285_c7_0553_cond,
n16_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue,
n16_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse,
n16_MUX_uxn_opcodes_h_l1285_c7_0553_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_cond,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_left,
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_right,
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output);

-- n16_MUX_uxn_opcodes_h_l1288_c7_795d
n16_MUX_uxn_opcodes_h_l1288_c7_795d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1288_c7_795d_cond,
n16_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue,
n16_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse,
n16_MUX_uxn_opcodes_h_l1288_c7_795d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d
result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_c9d5
n16_MUX_uxn_opcodes_h_l1293_c7_c9d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_left,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_right,
BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output);

-- n16_MUX_uxn_opcodes_h_l1296_c7_ec33
n16_MUX_uxn_opcodes_h_l1296_c7_ec33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1296_c7_ec33_cond,
n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue,
n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse,
n16_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_cond,
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a
BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_left,
BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_right,
BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1299_c30_7492
sp_relative_shift_uxn_opcodes_h_l1299_c30_7492 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_ins,
sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_x,
sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_y,
sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9
BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_return_output);

-- MUX_uxn_opcodes_h_l1302_c21_d18d
MUX_uxn_opcodes_h_l1302_c21_d18d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1302_c21_d18d_cond,
MUX_uxn_opcodes_h_l1302_c21_d18d_iftrue,
MUX_uxn_opcodes_h_l1302_c21_d18d_iffalse,
MUX_uxn_opcodes_h_l1302_c21_d18d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_left,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_right,
BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717
CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output,
 n16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 t16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output,
 n16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 t16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output,
 n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output,
 n16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 t16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output,
 n16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 t16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output,
 n16_MUX_uxn_opcodes_h_l1285_c7_0553_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output,
 n16_MUX_uxn_opcodes_h_l1288_c7_795d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output,
 n16_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_return_output,
 MUX_uxn_opcodes_h_l1302_c21_d18d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_86af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1271_c3_981b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_8bc2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_e4aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_70ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_5e87 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_2a2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_32a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_891f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1296_c7_ec33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1274_l1297_l1282_l1289_DUPLICATE_f538_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1310_l1261_DUPLICATE_32c2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_86af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_86af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1271_c3_981b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1271_c3_981b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_70ac := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_70ac;
     VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_8bc2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_8bc2;
     VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_32a1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_32a1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_5e87 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_5e87;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_2a2e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_2a2e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_891f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_891f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_e4aa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1279_c3_e4aa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_iftrue := resize(to_unsigned(1, 1), 8);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_16bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1299_c30_7492] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_ins;
     sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_x;
     sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_return_output := sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1274_l1297_l1282_l1289_DUPLICATE_f538 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1274_l1297_l1282_l1289_DUPLICATE_f538_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1273_c11_3bb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1288_c11_7284] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_left;
     BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output := BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_cb7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1296_c7_ec33_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_3c4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_692f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1296_c11_1330] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_left;
     BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output := BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_8efa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1265_c6_9e5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1304_c11_beea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c6_9e5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_3c4d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1273_c11_3bb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_692f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_cb7c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_16bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_7284_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_8efa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1296_c11_1330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1304_c11_beea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1274_l1297_l1282_l1289_DUPLICATE_f538_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1274_l1297_l1282_l1289_DUPLICATE_f538_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1274_l1297_l1282_l1289_DUPLICATE_f538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_2cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1296_l1270_l1293_l1288_l1285_l1281_DUPLICATE_a31a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_7fe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1304_l1273_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_b302_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1278_l1273_l1296_l1270_l1293_l1265_l1288_l1285_l1281_DUPLICATE_5255_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1296_c7_ec33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1299_c30_7492_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1304_c7_cc80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1297_c3_d14a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_left;
     BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output := BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1304_c7_cc80] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1282_c3_b76a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_left;
     BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_return_output := BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1304_c7_cc80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1282_c3_b76a_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1297_c3_d14a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1275_l1290_DUPLICATE_b717_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1304_c7_cc80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c21_f3f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     t16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     t16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := t16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_c9d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_c9d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;

     -- n16_MUX[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1296_c7_ec33_cond <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_cond;
     n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue;
     n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output := n16_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c21_f3f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     -- MUX[uxn_opcodes_h_l1302_c21_d18d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1302_c21_d18d_cond <= VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_cond;
     MUX_uxn_opcodes_h_l1302_c21_d18d_iftrue <= VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_iftrue;
     MUX_uxn_opcodes_h_l1302_c21_d18d_iffalse <= VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_return_output := MUX_uxn_opcodes_h_l1302_c21_d18d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_c9d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_c9d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1288_c7_795d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_c9d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_c9d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := t16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1288_c7_795d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue := VAR_MUX_uxn_opcodes_h_l1302_c21_d18d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_0553] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1288_c7_795d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1288_c7_795d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1288_c7_795d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1288_c7_795d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_cond;
     n16_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue;
     n16_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_return_output := n16_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1288_c7_795d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1296_c7_ec33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output := result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;

     -- t16_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_0553] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1296_c7_ec33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1285_c7_0553] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1285_c7_0553_cond <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_cond;
     n16_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue;
     n16_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_return_output := n16_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;

     -- t16_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     t16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     t16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := t16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_0553] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_0553] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_0553] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_c9d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c9d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- t16_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := t16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     n16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     n16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := n16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1288_c7_795d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1288_c7_795d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1285_c7_0553] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_return_output := result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- n16_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := n16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_0553_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1281_c7_661d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1281_c7_661d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1278_c7_2c50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output := result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;

     -- n16_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     n16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     n16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := n16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_2c50_return_output;
     -- n16_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := n16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1273_c7_1ac7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1273_c7_1ac7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_543a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_543a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1265_c2_16b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1310_l1261_DUPLICATE_32c2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1310_l1261_DUPLICATE_32c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c2_16b5_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1310_l1261_DUPLICATE_32c2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1310_l1261_DUPLICATE_32c2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
