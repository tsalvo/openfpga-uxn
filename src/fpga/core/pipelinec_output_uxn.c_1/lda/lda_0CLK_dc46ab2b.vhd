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
-- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_cf01]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_a317]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1330_c2_6343]
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_6343]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_6343]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_6343]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_6343]
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_6343]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_6343]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_6343]
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1330_c2_6343]
signal t16_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1331_c3_78d4[uxn_opcodes_h_l1331_c3_78d4]
signal printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_d5d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1335_c7_003a]
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_003a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_003a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_003a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_003a]
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_003a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_003a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_003a]
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1335_c7_003a]
signal t16_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_ef1f]
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1338_c7_98b6]
signal t16_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1340_c3_de98]
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_9525]
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1342_c7_e7be]
signal t16_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1343_c3_9bd1]
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1345_c30_3017]
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_7d1e]
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1348_c7_9ee8]
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_9ee8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_9ee8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_9ee8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_9ee8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_9ee8]
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_fe7a]
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1351_c7_811e]
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_811e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_811e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_811e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_811e]
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_5810]
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_cd21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_cd21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5517( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1330_c2_6343
tmp8_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- t16_MUX_uxn_opcodes_h_l1330_c2_6343
t16_MUX_uxn_opcodes_h_l1330_c2_6343 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1330_c2_6343_cond,
t16_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue,
t16_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse,
t16_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

-- printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4
printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4 : entity work.printf_uxn_opcodes_h_l1331_c3_78d4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1335_c7_003a
tmp8_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- t16_MUX_uxn_opcodes_h_l1335_c7_003a
t16_MUX_uxn_opcodes_h_l1335_c7_003a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1335_c7_003a_cond,
t16_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue,
t16_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse,
t16_MUX_uxn_opcodes_h_l1335_c7_003a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_left,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_right,
BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6
tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1338_c7_98b6
t16_MUX_uxn_opcodes_h_l1338_c7_98b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1338_c7_98b6_cond,
t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue,
t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse,
t16_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1340_c3_de98
CONST_SL_8_uxn_opcodes_h_l1340_c3_de98 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_x,
CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_left,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_right,
BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be
tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- t16_MUX_uxn_opcodes_h_l1342_c7_e7be
t16_MUX_uxn_opcodes_h_l1342_c7_e7be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1342_c7_e7be_cond,
t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue,
t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse,
t16_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1
BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_left,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_right,
BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1345_c30_3017
sp_relative_shift_uxn_opcodes_h_l1345_c30_3017 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_ins,
sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_x,
sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_y,
sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_left,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_right,
BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8
tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond,
tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_left,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_right,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1351_c7_811e
tmp8_MUX_uxn_opcodes_h_l1351_c7_811e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_cond,
tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_left,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_right,
BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_return_output,
 tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 t16_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output,
 tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 t16_MUX_uxn_opcodes_h_l1335_c7_003a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 t16_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output,
 CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output,
 tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 t16_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_5020 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_7c78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_7aee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1348_l1338_l1330_l1335_DUPLICATE_ebfa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_0122_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_bada_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_0410_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1348_l1338_l1351_l1342_DUPLICATE_4697_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1362_l1325_DUPLICATE_deb8_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_7aee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_7aee;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_7c78 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1336_c3_7c78;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_5020 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_5020;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse := tmp8;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1348_l1338_l1351_l1342_DUPLICATE_4697 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1348_l1338_l1351_l1342_DUPLICATE_4697_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1338_c11_ef1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_0410 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_0410_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c11_d5d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c6_cf01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1345_c30_3017] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_ins;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_x;
     sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_return_output := sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_bada LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_bada_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1348_c11_7d1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1342_c11_9525] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_left;
     BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output := BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1348_l1338_l1330_l1335_DUPLICATE_ebfa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1348_l1338_l1330_l1335_DUPLICATE_ebfa_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_fe7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1357_c11_5810] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_left;
     BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output := BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_0122 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_0122_return_output := result.u16_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c6_cf01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c11_d5d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1338_c11_ef1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1342_c11_9525_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1348_c11_7d1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_fe7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1357_c11_5810_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_0410_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1339_l1343_DUPLICATE_0410_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_bada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_bada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_bada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_bada_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_0122_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_0122_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_0122_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1338_l1330_l1342_l1335_DUPLICATE_0122_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1357_l1351_l1348_l1342_l1338_l1335_DUPLICATE_ad26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1348_l1338_l1330_l1335_DUPLICATE_ebfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1348_l1338_l1330_l1335_DUPLICATE_ebfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1348_l1338_l1330_l1335_DUPLICATE_ebfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1348_l1338_l1330_l1335_DUPLICATE_ebfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1330_l1357_l1348_l1342_l1338_l1335_DUPLICATE_1079_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1348_l1338_l1351_l1342_DUPLICATE_4697_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1348_l1338_l1351_l1342_DUPLICATE_4697_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1348_l1338_l1351_l1342_DUPLICATE_4697_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1348_l1338_l1351_l1342_DUPLICATE_4697_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1330_l1351_l1348_l1342_l1338_l1335_DUPLICATE_028b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1345_c30_3017_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1330_c1_a317] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1351_c7_811e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1343_c3_9bd1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_left;
     BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output := BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_811e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1351_c7_811e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_cond;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_return_output := tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1340_c3_de98] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_return_output := CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1357_c7_cd21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1357_c7_cd21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1348_c7_9ee8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1343_c3_9bd1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1340_c3_de98_return_output;
     VAR_printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1330_c1_a317_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1357_c7_cd21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_811e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;

     -- printf_uxn_opcodes_h_l1331_c3_78d4[uxn_opcodes_h_l1331_c3_78d4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1331_c3_78d4_uxn_opcodes_h_l1331_c3_78d4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := t16_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1348_c7_9ee8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1348_c7_9ee8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output := tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_811e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1348_c7_9ee8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_811e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1348_c7_9ee8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- t16_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := t16_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1348_c7_9ee8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1348_c7_9ee8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     t16_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     t16_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := t16_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1342_c7_e7be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1342_c7_e7be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- t16_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     t16_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     t16_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := t16_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1338_c7_98b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1338_c7_98b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1335_c7_003a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1335_c7_003a_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c2_6343] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1362_l1325_DUPLICATE_deb8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1362_l1325_DUPLICATE_deb8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5517(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c2_6343_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c2_6343_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1362_l1325_DUPLICATE_deb8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1362_l1325_DUPLICATE_deb8_return_output;
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
