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
-- Submodules: 76
entity lda2_0CLK_a5ec1955 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_a5ec1955;
architecture arch of lda2_0CLK_a5ec1955 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1734_c6_c2e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1734_c2_462c]
signal t16_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1734_c2_462c]
signal tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c2_462c]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c2_462c]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c2_462c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c2_462c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c2_462c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c2_462c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1741_c11_5fad]
signal BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1741_c7_7a2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_5654]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_5ecc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1746_c3_701b]
signal CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_be7c]
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_ccfe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1749_c3_afd4]
signal BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1751_c30_e09d]
signal sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_1116]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1754_c7_526c]
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1754_c7_526c]
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1754_c7_526c]
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_526c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_526c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_526c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_526c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1756_c22_961d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_cac3]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1758_c7_736b]
signal tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_736b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_736b]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_736b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_736b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1760_c3_849e]
signal CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_de23]
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1762_c7_72aa]
signal tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_72aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1762_c7_72aa]
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1762_c7_72aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1762_c7_72aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1763_c3_b711]
signal BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1768_c11_b6dc]
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1768_c7_ef5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1768_c7_ef5b]
signal result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1768_c7_ef5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1768_c7_ef5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1770_c31_ed9d]
signal CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1772_c11_928e]
signal BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1772_c7_7348]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1772_c7_7348]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e78e( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output);

-- t16_MUX_uxn_opcodes_h_l1734_c2_462c
t16_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
t16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
t16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
t16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1734_c2_462c
tmp16_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad
BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_left,
BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_right,
BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output);

-- t16_MUX_uxn_opcodes_h_l1741_c7_7a2f
t16_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f
tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f
result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f
result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f
result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f
result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output);

-- t16_MUX_uxn_opcodes_h_l1744_c7_5ecc
t16_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc
tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1746_c3_701b
CONST_SL_8_uxn_opcodes_h_l1746_c3_701b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_x,
CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_left,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_right,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output);

-- t16_MUX_uxn_opcodes_h_l1748_c7_ccfe
t16_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe
tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4
BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_left,
BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_right,
BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d
sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_ins,
sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_x,
sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_y,
sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1754_c7_526c
tmp16_MUX_uxn_opcodes_h_l1754_c7_526c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_cond,
tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d
BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1758_c7_736b
tmp16_MUX_uxn_opcodes_h_l1758_c7_736b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_cond,
tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1760_c3_849e
CONST_SL_8_uxn_opcodes_h_l1760_c3_849e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_x,
CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_left,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_right,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa
tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_cond,
tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711
BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_left,
BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_right,
BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_left,
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_right,
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b
result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b
result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d
CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_x,
CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e
BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_left,
BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_right,
BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348
result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348
result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output,
 t16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output,
 t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output,
 t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output,
 CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output,
 t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output,
 tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output,
 tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1738_c3_da0d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1742_c3_ebdd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1756_c3_2daa : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1755_c3_b98a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_e33f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1766_c21_3845_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_2328 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1770_c21_4c7c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_b98c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_95cf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1745_DUPLICATE_9c6e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1759_l1763_DUPLICATE_46d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1730_l1777_DUPLICATE_99d3_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1755_c3_b98a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1755_c3_b98a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1738_c3_da0d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1738_c3_da0d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1742_c3_ebdd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1742_c3_ebdd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_2328 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1769_c3_2328;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_e33f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_e33f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1745_DUPLICATE_9c6e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1745_DUPLICATE_9c6e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_be7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1768_c11_b6dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1772_c11_928e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1770_c31_ed9d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_return_output := CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c6_c2e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_cac3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_5654] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1741_c11_5fad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1759_l1763_DUPLICATE_46d5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1759_l1763_DUPLICATE_46d5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1756_c22_961d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_1116] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_95cf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_95cf_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_b98c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_b98c_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_de23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_left;
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output := BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1751_c30_e09d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_ins;
     sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_x;
     sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_return_output := sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c6_c2e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1741_c11_5fad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_5654_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_be7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_1116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_cac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_de23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_b6dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1772_c11_928e_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1756_c3_2daa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1756_c22_961d_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1745_DUPLICATE_9c6e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1749_l1745_DUPLICATE_9c6e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1759_l1763_DUPLICATE_46d5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1759_l1763_DUPLICATE_46d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_95cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_95cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_95cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_95cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_b98c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_b98c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_b98c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1741_l1754_l1744_l1734_DUPLICATE_b98c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1762_DUPLICATE_2381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1772_l1741_l1768_l1734_DUPLICATE_8208_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1768_DUPLICATE_ead7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1758_l1754_l1748_l1744_l1741_l1768_l1734_DUPLICATE_9cbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1751_c30_e09d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1756_c3_2daa;
     -- CONST_SL_8[uxn_opcodes_h_l1760_c3_849e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_return_output := CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1768_c7_ef5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1746_c3_701b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_return_output := CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1772_c7_7348] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1770_c21_4c7c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1770_c21_4c7c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1770_c31_ed9d_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1763_c3_b711] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_left;
     BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output := BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1749_c3_afd4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_left;
     BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output := BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1754_c7_526c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1772_c7_7348] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c7_526c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1749_c3_afd4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1770_c21_4c7c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_701b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1760_c3_849e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1772_c7_7348_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1772_c7_7348_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;
     -- t16_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1768_c7_ef5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1766_c21_3845] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1766_c21_3845_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1763_c3_b711_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1762_c7_72aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_cond;
     tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output := tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1768_c7_ef5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1768_c7_ef5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1762_c7_72aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1766_c21_3845_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1768_c7_ef5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1762_c7_72aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_736b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1758_c7_736b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_cond;
     tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_return_output := tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_72aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1762_c7_72aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1762_c7_72aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_736b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_736b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_736b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_526c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1754_c7_526c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_cond;
     tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_return_output := tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_736b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_526c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     t16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     t16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := t16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1754_c7_526c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_526c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_526c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_ccfe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1748_c7_ccfe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_5ecc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_5ecc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1741_c7_7a2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1741_c7_7a2f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c2_462c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1730_l1777_DUPLICATE_99d3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1730_l1777_DUPLICATE_99d3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e78e(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c2_462c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c2_462c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1730_l1777_DUPLICATE_99d3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1730_l1777_DUPLICATE_99d3_return_output;
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
