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
-- Submodules: 99
entity lda2_0CLK_8a233c30 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_8a233c30;
architecture arch of lda2_0CLK_8a233c30 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1863_c6_43d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1863_c2_c1c6]
signal t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_b3e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1868_c7_c0e7]
signal t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_f292]
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1871_c7_8727]
signal tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1871_c7_8727]
signal result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1871_c7_8727]
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_8727]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_8727]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_8727]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_8727]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_8727]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1871_c7_8727]
signal t16_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1873_c3_7d1d]
signal CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_fa8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1876_c7_41e0]
signal t16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1879_c11_a179]
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1879_c7_1df0]
signal t16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1880_c3_b372]
signal BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1882_c30_cd86]
signal sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1885_c11_c046]
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1885_c7_8dfc]
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1885_c7_8dfc]
signal result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1885_c7_8dfc]
signal result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1885_c7_8dfc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1885_c7_8dfc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1885_c7_8dfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1885_c7_8dfc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_d79d]
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1889_c7_33d7]
signal tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1889_c7_33d7]
signal result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1889_c7_33d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_33d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_33d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_33d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1891_c3_59c2]
signal CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1892_c22_523a]
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_65cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1894_c7_6b61]
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1894_c7_6b61]
signal result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1894_c7_6b61]
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_6b61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_6b61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_6b61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1895_c22_acbf]
signal BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1897_c11_58bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1897_c7_8ea1]
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1897_c7_8ea1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1897_c7_8ea1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1897_c7_8ea1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1897_c7_8ea1]
signal result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1898_c3_4223]
signal BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_a717]
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_f79a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_f79a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_f79a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1903_c7_f79a]
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1905_c31_9f54]
signal CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1907_c11_8549]
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1907_c7_78b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1907_c7_78b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6
tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6
result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- t16_MUX_uxn_opcodes_h_l1863_c2_c1c6
t16_MUX_uxn_opcodes_h_l1863_c2_c1c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond,
t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue,
t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse,
t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7
tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- t16_MUX_uxn_opcodes_h_l1868_c7_c0e7
t16_MUX_uxn_opcodes_h_l1868_c7_c0e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond,
t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue,
t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse,
t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_left,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_right,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1871_c7_8727
tmp16_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727
result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- t16_MUX_uxn_opcodes_h_l1871_c7_8727
t16_MUX_uxn_opcodes_h_l1871_c7_8727 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1871_c7_8727_cond,
t16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue,
t16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse,
t16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d
CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_x,
CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0
tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1876_c7_41e0
t16_MUX_uxn_opcodes_h_l1876_c7_41e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond,
t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue,
t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse,
t16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_left,
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_right,
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0
tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0
result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0
result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0
result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- t16_MUX_uxn_opcodes_h_l1879_c7_1df0
t16_MUX_uxn_opcodes_h_l1879_c7_1df0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond,
t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue,
t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse,
t16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372
BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_left,
BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_right,
BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86
sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_ins,
sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_x,
sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_y,
sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_left,
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_right,
BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc
tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond,
tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc
result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc
result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_left,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_right,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7
tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_cond,
tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7
result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7
result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2
CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_x,
CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_left,
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_right,
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61
tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_cond,
tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue,
tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse,
tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61
result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond,
result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf
BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_left,
BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_right,
BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1
tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond,
tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1
result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223
BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_left,
BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_right,
BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_left,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_right,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54
CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_x,
CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_left,
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_right,
BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output,
 tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 t16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output,
 CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 t16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output,
 tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 t16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output,
 sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output,
 tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output,
 CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_890c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_814c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_cfcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_b231 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1892_c3_a3e5 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1895_c3_23de : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_3794 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1901_c21_b2f9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_bd90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1905_c21_4e53_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1872_l1880_DUPLICATE_b848_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1898_l1890_DUPLICATE_ab87_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1859_l1912_DUPLICATE_474d_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_b231 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_b231;
     VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_right := to_unsigned(10, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_890c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_890c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_bd90 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_bd90;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_814c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_814c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_3794 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_3794;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_cfcf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_cfcf;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1897_c11_58bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_f292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_left;
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output := BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_fa8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1907_c11_8549] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_left;
     BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output := BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1898_l1890_DUPLICATE_ab87 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1898_l1890_DUPLICATE_ab87_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1882_c30_cd86] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_ins;
     sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_x;
     sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_return_output := sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1905_c31_9f54] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_return_output := CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1879_c11_a179] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_left;
     BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output := BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_a717] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_left;
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output := BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1895_c22_acbf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_d79d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_b3e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1892_c22_523a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c6_43d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1885_c11_c046] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_left;
     BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output := BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_65cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1872_l1880_DUPLICATE_b848 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1872_l1880_DUPLICATE_b848_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c6_43d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_b3e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_f292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_fa8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_a179_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1885_c11_c046_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_d79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_65cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1897_c11_58bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_a717_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1907_c11_8549_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1892_c3_a3e5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_523a_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l1895_c3_23de := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1895_c22_acbf_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1872_l1880_DUPLICATE_b848_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1872_l1880_DUPLICATE_b848_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1898_l1890_DUPLICATE_ab87_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1898_l1890_DUPLICATE_ab87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1868_l1863_l1879_l1876_l1871_DUPLICATE_63d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1876_l1871_DUPLICATE_492d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1868_l1894_l1889_l1885_l1879_l1907_l1876_l1903_l1871_l1897_DUPLICATE_58bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1868_l1863_l1885_l1876_l1871_DUPLICATE_1911_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1907_l1876_l1903_l1871_DUPLICATE_9c94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1894_l1889_l1885_l1879_l1903_DUPLICATE_e8d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1868_l1894_l1863_l1889_l1885_l1879_l1876_l1903_l1871_DUPLICATE_8900_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1882_c30_cd86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1892_c3_a3e5;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1895_c3_23de;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1885_c7_8dfc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1873_c3_7d1d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_return_output := CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1898_c3_4223] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_left;
     BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output := BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1905_c21_4e53] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1905_c21_4e53_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1905_c31_9f54_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_f79a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1880_c3_b372] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_left;
     BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output := BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1907_c7_78b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1907_c7_78b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1891_c3_59c2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_return_output := CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1894_c7_6b61] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output := result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1880_c3_b372_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1905_c21_4e53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1873_c3_7d1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1891_c3_59c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1907_c7_78b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_f79a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_f79a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1901_c21_b2f9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1901_c21_b2f9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1898_c3_4223_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1897_c7_8ea1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1903_c7_f79a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1889_c7_33d7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1897_c7_8ea1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond;
     tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output := tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := t16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1901_c21_b2f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1903_c7_f79a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1897_c7_8ea1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1897_c7_8ea1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := t16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1885_c7_8dfc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1897_c7_8ea1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1894_c7_6b61] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_cond;
     tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output := tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_6b61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1897_c7_8ea1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1889_c7_33d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_cond;
     tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output := tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_6b61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_6b61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;

     -- t16_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     t16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     t16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := t16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1894_c7_6b61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output := result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_33d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_6b61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1885_c7_8dfc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1889_c7_33d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1885_c7_8dfc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond;
     tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output := tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_33d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_33d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1889_c7_33d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1885_c7_8dfc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1885_c7_8dfc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1885_c7_8dfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1885_c7_8dfc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1879_c7_1df0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1879_c7_1df0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_41e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_41e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_8727] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1871_c7_8727_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_c0e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c0e7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c2_c1c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1859_l1912_DUPLICATE_474d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1859_l1912_DUPLICATE_474d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c2_c1c6_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1859_l1912_DUPLICATE_474d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1859_l1912_DUPLICATE_474d_return_output;
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
