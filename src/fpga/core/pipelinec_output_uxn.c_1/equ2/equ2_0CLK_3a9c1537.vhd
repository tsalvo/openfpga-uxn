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
entity equ2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_3a9c1537;
architecture arch of equ2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1337_c6_48ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1337_c1_42f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1337_c2_c413]
signal n16_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1337_c2_c413]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1337_c2_c413]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1337_c2_c413]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1337_c2_c413]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1337_c2_c413]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1337_c2_c413]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1337_c2_c413]
signal result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1337_c2_c413]
signal t16_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1338_c3_9601[uxn_opcodes_h_l1338_c3_9601]
signal printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1343_c11_7165]
signal BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1343_c7_f381]
signal n16_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1343_c7_f381]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1343_c7_f381]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1343_c7_f381]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1343_c7_f381]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1343_c7_f381]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1343_c7_f381]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1343_c7_f381]
signal result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1343_c7_f381]
signal t16_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1346_c11_61a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal n16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1346_c7_fa44]
signal t16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_ff26]
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1351_c7_efce]
signal n16_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1351_c7_efce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1351_c7_efce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1351_c7_efce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_efce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_efce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_efce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1351_c7_efce]
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1351_c7_efce]
signal t16_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1354_c11_6dec]
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1354_c7_beea]
signal n16_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1354_c7_beea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1354_c7_beea]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1354_c7_beea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1354_c7_beea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1354_c7_beea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1354_c7_beea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1354_c7_beea]
signal result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1354_c7_beea]
signal t16_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1355_c3_449d]
signal BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_d098]
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1358_c7_a5f1]
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_0168]
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal n16_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1361_c7_76cf]
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_e7a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1366_c7_9e7e]
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1369_c11_fa0d]
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1369_c7_4246]
signal n16_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1369_c7_4246]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1369_c7_4246]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1369_c7_4246]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1369_c7_4246]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1369_c7_4246]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1369_c7_4246]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1369_c7_4246]
signal result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1370_c3_2e0d]
signal BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1373_c32_78b6]
signal BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1373_c32_9716]
signal BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1373_c32_777f]
signal MUX_uxn_opcodes_h_l1373_c32_777f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1373_c32_777f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1373_c32_777f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1373_c32_777f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1375_c11_17a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1375_c7_36de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c7_36de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c7_36de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c7_36de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1375_c7_36de]
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1379_c24_14f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1379_c24_d2ec]
signal MUX_uxn_opcodes_h_l1379_c24_d2ec_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1379_c24_d2ec_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1379_c24_d2ec_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1379_c24_d2ec_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_b46f]
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_556c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_556c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee
BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_return_output);

-- n16_MUX_uxn_opcodes_h_l1337_c2_c413
n16_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
n16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
n16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
n16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413
result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413
result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413
result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413
result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- t16_MUX_uxn_opcodes_h_l1337_c2_c413
t16_MUX_uxn_opcodes_h_l1337_c2_c413 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1337_c2_c413_cond,
t16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue,
t16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse,
t16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

-- printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601
printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601 : entity work.printf_uxn_opcodes_h_l1338_c3_9601_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_left,
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_right,
BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output);

-- n16_MUX_uxn_opcodes_h_l1343_c7_f381
n16_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
n16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
n16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
n16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381
result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381
result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381
result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381
result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- t16_MUX_uxn_opcodes_h_l1343_c7_f381
t16_MUX_uxn_opcodes_h_l1343_c7_f381 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1343_c7_f381_cond,
t16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue,
t16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse,
t16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1346_c7_fa44
n16_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
n16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44
result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- t16_MUX_uxn_opcodes_h_l1346_c7_fa44
t16_MUX_uxn_opcodes_h_l1346_c7_fa44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond,
t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue,
t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse,
t16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_left,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_right,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output);

-- n16_MUX_uxn_opcodes_h_l1351_c7_efce
n16_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
n16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
n16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
n16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- t16_MUX_uxn_opcodes_h_l1351_c7_efce
t16_MUX_uxn_opcodes_h_l1351_c7_efce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1351_c7_efce_cond,
t16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue,
t16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse,
t16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_left,
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_right,
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output);

-- n16_MUX_uxn_opcodes_h_l1354_c7_beea
n16_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
n16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
n16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
n16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea
result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea
result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- t16_MUX_uxn_opcodes_h_l1354_c7_beea
t16_MUX_uxn_opcodes_h_l1354_c7_beea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1354_c7_beea_cond,
t16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue,
t16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse,
t16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d
BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_left,
BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_right,
BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_left,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_right,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output);

-- n16_MUX_uxn_opcodes_h_l1358_c7_a5f1
n16_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_left,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_right,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output);

-- n16_MUX_uxn_opcodes_h_l1361_c7_76cf
n16_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
n16_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output);

-- n16_MUX_uxn_opcodes_h_l1366_c7_9e7e
n16_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_left,
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_right,
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output);

-- n16_MUX_uxn_opcodes_h_l1369_c7_4246
n16_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
n16_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
n16_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
n16_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246
result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246
result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_cond,
result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d
BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_left,
BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_right,
BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6
BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_left,
BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_right,
BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716
BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_left,
BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_right,
BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_return_output);

-- MUX_uxn_opcodes_h_l1373_c32_777f
MUX_uxn_opcodes_h_l1373_c32_777f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1373_c32_777f_cond,
MUX_uxn_opcodes_h_l1373_c32_777f_iftrue,
MUX_uxn_opcodes_h_l1373_c32_777f_iffalse,
MUX_uxn_opcodes_h_l1373_c32_777f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de
result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4
BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_return_output);

-- MUX_uxn_opcodes_h_l1379_c24_d2ec
MUX_uxn_opcodes_h_l1379_c24_d2ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1379_c24_d2ec_cond,
MUX_uxn_opcodes_h_l1379_c24_d2ec_iftrue,
MUX_uxn_opcodes_h_l1379_c24_d2ec_iffalse,
MUX_uxn_opcodes_h_l1379_c24_d2ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_left,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_right,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585
CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_return_output,
 n16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 t16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output,
 n16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 t16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output,
 n16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 t16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output,
 n16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 t16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output,
 n16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 t16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output,
 n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output,
 n16_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output,
 n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output,
 n16_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_return_output,
 MUX_uxn_opcodes_h_l1373_c32_777f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_return_output,
 MUX_uxn_opcodes_h_l1379_c24_d2ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1340_c3_25aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1344_c3_0840 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1349_c3_6cb6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_653e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_7b95 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_1237 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_78fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_be78 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1373_c32_777f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1373_c32_777f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1373_c32_777f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1373_c32_777f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1378_c3_85e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1347_l1370_l1355_l1362_DUPLICATE_be9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1375_l1369_DUPLICATE_caae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1386_l1333_DUPLICATE_0cda_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_1237 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_1237;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1340_c3_25aa := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1340_c3_25aa;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1378_c3_85e3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1378_c3_85e3;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1373_c32_777f_iffalse := resize(to_signed(-3, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_78fd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_78fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1373_c32_777f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_be78 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_be78;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_7b95 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1356_c3_7b95;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1349_c3_6cb6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1349_c3_6cb6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_653e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1352_c3_653e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1344_c3_0840 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1344_c3_0840;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_d098] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_left;
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output := BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1375_l1369_DUPLICATE_caae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1375_l1369_DUPLICATE_caae_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1373_c32_78b6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_left;
     BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_return_output := BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1343_c11_7165] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_left;
     BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output := BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1379_c24_14f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1369_c11_fa0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_ff26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_left;
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output := BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1375_c11_17a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1347_l1370_l1355_l1362_DUPLICATE_be9c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1347_l1370_l1355_l1362_DUPLICATE_be9c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1337_c6_48ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_e7a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1354_c11_6dec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1346_c11_61a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_b46f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_0168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_left;
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output := BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1373_c32_78b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1337_c6_48ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1343_c11_7165_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1346_c11_61a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_ff26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6dec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_d098_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_0168_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_e7a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_fa0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1375_c11_17a2_return_output;
     VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c24_14f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_b46f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1347_l1370_l1355_l1362_DUPLICATE_be9c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1347_l1370_l1355_l1362_DUPLICATE_be9c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1347_l1370_l1355_l1362_DUPLICATE_be9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_7f38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1361_l1358_l1354_l1381_DUPLICATE_c62b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_c219_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1361_l1358_l1354_DUPLICATE_8801_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1351_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_l1381_DUPLICATE_8926_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1375_l1369_DUPLICATE_caae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1375_l1369_DUPLICATE_caae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1351_l1375_l1346_l1369_l1343_l1366_l1337_l1361_l1358_l1354_DUPLICATE_46cb_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1373_c32_9716] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_left;
     BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_return_output := BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_556c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1375_c7_36de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1375_c7_36de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1355_c3_449d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_left;
     BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_return_output := BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1337_c1_42f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_return_output;

     -- MUX[uxn_opcodes_h_l1379_c24_d2ec] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1379_c24_d2ec_cond <= VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_cond;
     MUX_uxn_opcodes_h_l1379_c24_d2ec_iftrue <= VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_iftrue;
     MUX_uxn_opcodes_h_l1379_c24_d2ec_iffalse <= VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_return_output := MUX_uxn_opcodes_h_l1379_c24_d2ec_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1370_c3_2e0d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_left;
     BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_return_output := BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_556c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1373_c32_777f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1373_c32_9716_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1355_c3_449d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_2e0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1348_l1363_DUPLICATE_5585_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue := VAR_MUX_uxn_opcodes_h_l1379_c24_d2ec_return_output;
     VAR_printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1337_c1_42f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_556c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_556c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1375_c7_36de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1375_c7_36de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;

     -- t16_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     t16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     t16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := t16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1375_c7_36de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;

     -- printf_uxn_opcodes_h_l1338_c3_9601[uxn_opcodes_h_l1338_c3_9601] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1338_c3_9601_uxn_opcodes_h_l1338_c3_9601_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     n16_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     n16_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := n16_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- MUX[uxn_opcodes_h_l1373_c32_777f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1373_c32_777f_cond <= VAR_MUX_uxn_opcodes_h_l1373_c32_777f_cond;
     MUX_uxn_opcodes_h_l1373_c32_777f_iftrue <= VAR_MUX_uxn_opcodes_h_l1373_c32_777f_iftrue;
     MUX_uxn_opcodes_h_l1373_c32_777f_iffalse <= VAR_MUX_uxn_opcodes_h_l1373_c32_777f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1373_c32_777f_return_output := MUX_uxn_opcodes_h_l1373_c32_777f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue := VAR_MUX_uxn_opcodes_h_l1373_c32_777f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1375_c7_36de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- n16_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- t16_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     t16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     t16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := t16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1369_c7_4246] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1369_c7_4246_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := t16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := n16_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_9e7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1366_c7_9e7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     t16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     t16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := t16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1361_c7_76cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1361_c7_76cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     t16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     t16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := t16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- n16_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     n16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     n16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := n16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_a5f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1358_c7_a5f1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- n16_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     n16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     n16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := n16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1354_c7_beea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1354_c7_beea_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1351_c7_efce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- n16_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := n16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1351_c7_efce_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1346_c7_fa44] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output := result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- n16_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     n16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     n16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := n16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1346_c7_fa44_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- n16_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     n16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     n16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := n16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1343_c7_f381] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_return_output := result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1343_c7_f381_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1337_c2_c413] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1386_l1333_DUPLICATE_0cda LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1386_l1333_DUPLICATE_0cda_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1337_c2_c413_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1337_c2_c413_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1386_l1333_DUPLICATE_0cda_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1386_l1333_DUPLICATE_0cda_return_output;
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
