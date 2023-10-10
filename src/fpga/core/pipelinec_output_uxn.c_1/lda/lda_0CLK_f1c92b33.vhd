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
-- Submodules: 81
entity lda_0CLK_f1c92b33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_f1c92b33;
architecture arch of lda_0CLK_f1c92b33 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1569_c6_6ca2]
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1569_c1_ab98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1569_c2_445f]
signal tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c2_445f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1569_c2_445f]
signal t16_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1570_c3_2e20[uxn_opcodes_h_l1570_c3_2e20]
signal printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1575_c11_850c]
signal BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1575_c7_1658]
signal tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1575_c7_1658]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1575_c7_1658]
signal t16_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_ba94]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1578_c7_4df8]
signal t16_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1580_c3_5cc9]
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1583_c11_a5d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1583_c7_c3ba]
signal t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_e680]
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1586_c7_b6b7]
signal t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1587_c3_26c7]
signal BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1590_c32_f8b5]
signal BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1590_c32_db49]
signal BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1590_c32_2c50]
signal MUX_uxn_opcodes_h_l1590_c32_2c50_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1590_c32_2c50_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1590_c32_2c50_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1590_c32_2c50_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1593_c11_b1d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1593_c7_7297]
signal tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1593_c7_7297]
signal result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1593_c7_7297]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1593_c7_7297]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1593_c7_7297]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1593_c7_7297]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1593_c7_7297]
signal result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_2b73]
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1597_c7_96dc]
signal tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_96dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_96dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_96dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_96dc]
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1603_c11_21e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1603_c7_8848]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1603_c7_8848]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_2155( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2
BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_left,
BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_right,
BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1569_c2_445f
tmp8_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f
result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f
result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- t16_MUX_uxn_opcodes_h_l1569_c2_445f
t16_MUX_uxn_opcodes_h_l1569_c2_445f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1569_c2_445f_cond,
t16_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue,
t16_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse,
t16_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

-- printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20
printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20 : entity work.printf_uxn_opcodes_h_l1570_c3_2e20_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c
BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_left,
BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_right,
BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1575_c7_1658
tmp8_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658
result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658
result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658
result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658
result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- t16_MUX_uxn_opcodes_h_l1575_c7_1658
t16_MUX_uxn_opcodes_h_l1575_c7_1658 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1575_c7_1658_cond,
t16_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue,
t16_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse,
t16_MUX_uxn_opcodes_h_l1575_c7_1658_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8
tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8
result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- t16_MUX_uxn_opcodes_h_l1578_c7_4df8
t16_MUX_uxn_opcodes_h_l1578_c7_4df8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1578_c7_4df8_cond,
t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue,
t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse,
t16_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9
CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_x,
CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba
tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- t16_MUX_uxn_opcodes_h_l1583_c7_c3ba
t16_MUX_uxn_opcodes_h_l1583_c7_c3ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond,
t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue,
t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse,
t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_left,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_right,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7
tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- t16_MUX_uxn_opcodes_h_l1586_c7_b6b7
t16_MUX_uxn_opcodes_h_l1586_c7_b6b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond,
t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue,
t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse,
t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7
BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_left,
BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_right,
BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5
BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_left,
BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_right,
BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49
BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_left,
BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_right,
BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_return_output);

-- MUX_uxn_opcodes_h_l1590_c32_2c50
MUX_uxn_opcodes_h_l1590_c32_2c50 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1590_c32_2c50_cond,
MUX_uxn_opcodes_h_l1590_c32_2c50_iftrue,
MUX_uxn_opcodes_h_l1590_c32_2c50_iffalse,
MUX_uxn_opcodes_h_l1590_c32_2c50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1593_c7_7297
tmp8_MUX_uxn_opcodes_h_l1593_c7_7297 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_cond,
tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue,
tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse,
tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297
result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297
result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297
result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297
result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_cond,
result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_left,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_right,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc
tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_cond,
tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue,
tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse,
tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4
BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848
result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_return_output,
 tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 t16_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 t16_MUX_uxn_opcodes_h_l1575_c7_1658_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output,
 tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 t16_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output,
 CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output,
 tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_return_output,
 MUX_uxn_opcodes_h_l1590_c32_2c50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output,
 tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output,
 tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_d4ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_33ed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1581_c3_3acc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_de45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_6645 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1583_l1575_l1586_l1578_DUPLICATE_5645_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_8076_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1593_l1597_l1586_DUPLICATE_3439_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1608_l1564_DUPLICATE_a15d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_de45 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1584_c3_de45;
     VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_6645 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1600_c3_6645;
     VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_33ed := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_33ed;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_d4ac := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_d4ac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1581_c3_3acc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1581_c3_3acc;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_8076 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_8076_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1583_c11_a5d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1569_c6_6ca2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1583_l1575_l1586_l1578_DUPLICATE_5645 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1583_l1575_l1586_l1578_DUPLICATE_5645_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1593_l1597_l1586_DUPLICATE_3439 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1593_l1597_l1586_DUPLICATE_3439_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1575_c11_850c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_e680] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_left;
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output := BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb_return_output := result.ram_addr;

     -- BIN_OP_AND[uxn_opcodes_h_l1590_c32_f8b5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_left;
     BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_return_output := BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1603_c11_21e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_ba94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_2b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1593_c11_b1d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1590_c32_f8b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1569_c6_6ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1575_c11_850c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_ba94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1583_c11_a5d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_e680_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1593_c11_b1d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_2b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c11_21e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_8076_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1587_DUPLICATE_8076_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1586_DUPLICATE_3001_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_cedb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1597_l1593_l1586_DUPLICATE_f2bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1593_DUPLICATE_c464_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1583_l1575_l1586_l1578_DUPLICATE_5645_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1583_l1575_l1586_l1578_DUPLICATE_5645_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1583_l1575_l1586_l1578_DUPLICATE_5645_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1583_l1575_l1586_l1578_DUPLICATE_5645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1603_l1569_l1593_l1586_DUPLICATE_3a64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1593_l1597_l1586_DUPLICATE_3439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1593_l1597_l1586_DUPLICATE_3439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1593_l1597_l1586_DUPLICATE_3439_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1583_l1578_l1575_l1569_l1597_l1593_l1586_DUPLICATE_0d0d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1569_c1_ab98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1597_c7_96dc] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_cond;
     tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output := tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1603_c7_8848] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1603_c7_8848] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1593_c7_7297] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1590_c32_db49] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_left;
     BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_return_output := BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1593_c7_7297] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_96dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1587_c3_26c7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_left;
     BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output := BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_96dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1580_c3_5cc9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_return_output := CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1590_c32_db49_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1587_c3_26c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cc9_return_output;
     VAR_printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1569_c1_ab98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c7_8848_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1603_c7_8848_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1593_c7_7297] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;

     -- t16_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_96dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;

     -- MUX[uxn_opcodes_h_l1590_c32_2c50] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1590_c32_2c50_cond <= VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_cond;
     MUX_uxn_opcodes_h_l1590_c32_2c50_iftrue <= VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_iftrue;
     MUX_uxn_opcodes_h_l1590_c32_2c50_iffalse <= VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_return_output := MUX_uxn_opcodes_h_l1590_c32_2c50_return_output;

     -- printf_uxn_opcodes_h_l1570_c3_2e20[uxn_opcodes_h_l1570_c3_2e20] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1570_c3_2e20_uxn_opcodes_h_l1570_c3_2e20_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1593_c7_7297] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_return_output := result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_96dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1593_c7_7297] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_cond;
     tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_return_output := tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue := VAR_MUX_uxn_opcodes_h_l1590_c32_2c50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_96dc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1593_c7_7297] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1593_c7_7297] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1593_c7_7297_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_b6b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := t16_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_b6b7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- t16_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     t16_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     t16_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := t16_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1583_c7_c3ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1583_c7_c3ba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- t16_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     t16_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     t16_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := t16_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_4df8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_4df8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1575_c7_1658] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1575_c7_1658_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1569_c2_445f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1608_l1564_DUPLICATE_a15d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1608_l1564_DUPLICATE_a15d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2155(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1569_c2_445f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1569_c2_445f_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1608_l1564_DUPLICATE_a15d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1608_l1564_DUPLICATE_a15d_return_output;
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
