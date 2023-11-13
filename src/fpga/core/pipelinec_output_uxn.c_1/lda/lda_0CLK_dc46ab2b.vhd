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
-- Submodules: 63
entity lda_0CLK_dc46ab2b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_dc46ab2b;
architecture arch of lda_0CLK_dc46ab2b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_9794]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_5964]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1330_c2_1d16]
signal t16_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1331_c3_45ec[uxn_opcodes_h_l1331_c3_45ec]
signal printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_8271]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_1606]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_1606]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_1606]
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_1606]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_1606]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_1606]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_1606]
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1335_c7_1606]
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1335_c7_1606]
signal t16_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_f8c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1338_c7_ec3a]
signal t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1340_c3_61b6]
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_c281]
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1342_c7_dd65]
signal t16_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1343_c3_bc01]
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1345_c30_d9b8]
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_bb0f]
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_71eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_71eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_71eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_71eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_71eb]
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1348_c7_71eb]
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_109d]
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_888c]
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_888c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_888c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_888c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1351_c7_888c]
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_29a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_e5ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_e5ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_856e( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16
tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- t16_MUX_uxn_opcodes_h_l1330_c2_1d16
t16_MUX_uxn_opcodes_h_l1330_c2_1d16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1330_c2_1d16_cond,
t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue,
t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse,
t16_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

-- printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec
printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec : entity work.printf_uxn_opcodes_h_l1331_c3_45ec_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1335_c7_1606
tmp8_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- t16_MUX_uxn_opcodes_h_l1335_c7_1606
t16_MUX_uxn_opcodes_h_l1335_c7_1606 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1335_c7_1606_cond,
t16_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue,
t16_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse,
t16_MUX_uxn_opcodes_h_l1335_c7_1606_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a
tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- t16_MUX_uxn_opcodes_h_l1338_c7_ec3a
t16_MUX_uxn_opcodes_h_l1338_c7_ec3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond,
t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue,
t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse,
t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6
CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_x,
CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_left,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_right,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65
tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- t16_MUX_uxn_opcodes_h_l1342_c7_dd65
t16_MUX_uxn_opcodes_h_l1342_c7_dd65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1342_c7_dd65_cond,
t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue,
t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse,
t16_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01
BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_left,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_right,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8
sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_ins,
sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_x,
sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_y,
sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_left,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_right,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb
tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_cond,
tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue,
tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse,
tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_left,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_right,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1351_c7_888c
tmp8_MUX_uxn_opcodes_h_l1351_c7_888c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_cond,
tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue,
tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse,
tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 t16_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 t16_MUX_uxn_opcodes_h_l1335_c7_1606_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 t16_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output,
 sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output,
 tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_2553 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_98f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_2b77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_12cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_f2ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_9fe3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_7266_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_60e7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1362_l1325_DUPLICATE_224d_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_2553 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_2553;
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_2b77 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_2b77;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_98f8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_98f8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_109d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_bb0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_c281] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_left;
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output := BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_29a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_9794] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_60e7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_60e7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_9fe3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_9fe3_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_f2ac LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_f2ac_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_8271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_12cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_12cf_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_f8c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_7266 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_7266_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1345_c30_d9b8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_ins;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_x;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_return_output := sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_9794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_8271_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_f8c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_c281_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_bb0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_109d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_29a9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_7266_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_7266_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_9fe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_9fe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_9fe3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_9fe3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_f2ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_f2ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_f2ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1330_l1342_l1335_l1338_DUPLICATE_f2ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1357_DUPLICATE_8957_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_12cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_12cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_12cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1330_l1335_l1348_l1338_DUPLICATE_12cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1348_l1342_l1338_l1335_l1330_l1357_DUPLICATE_fa15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_60e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_60e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_60e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1351_l1342_l1348_l1338_DUPLICATE_60e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1351_l1348_l1342_l1338_l1335_l1330_DUPLICATE_518e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_d9b8_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1351_c7_888c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_cond;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_return_output := tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_71eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_888c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_e5ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_888c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1340_c3_61b6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_return_output := CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1343_c3_bc01] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_left;
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output := BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_5964] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_e5ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_bc01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_61b6_return_output;
     VAR_printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_5964_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_e5ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := t16_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_888c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1348_c7_71eb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_cond;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output := tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_888c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;

     -- printf_uxn_opcodes_h_l1331_c3_45ec[uxn_opcodes_h_l1331_c3_45ec] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1331_c3_45ec_uxn_opcodes_h_l1331_c3_45ec_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_71eb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_71eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_888c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- t16_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_71eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_71eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_71eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     t16_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     t16_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := t16_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_dd65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_dd65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     -- t16_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := t16_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_ec3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_ec3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_1606] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_1606_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_1d16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1362_l1325_DUPLICATE_224d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1362_l1325_DUPLICATE_224d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_856e(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_1d16_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1362_l1325_DUPLICATE_224d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1362_l1325_DUPLICATE_224d_return_output;
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
