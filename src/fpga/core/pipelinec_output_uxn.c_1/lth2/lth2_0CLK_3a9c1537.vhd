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
entity lth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_3a9c1537;
architecture arch of lth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1227_c6_6418]
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1227_c1_d8bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1227_c2_4642]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c2_4642]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c2_4642]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c2_4642]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1227_c2_4642]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c2_4642]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1227_c2_4642]
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1227_c2_4642]
signal t16_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1227_c2_4642]
signal n16_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1228_c3_0038[uxn_opcodes_h_l1228_c3_0038]
signal printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_2aea]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_dfb1]
signal n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_fdc3]
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1236_c7_3501]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_3501]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_3501]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_3501]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1236_c7_3501]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_3501]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1236_c7_3501]
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1236_c7_3501]
signal t16_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1236_c7_3501]
signal n16_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_d310]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_5123]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_5123]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_5123]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_5123]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_5123]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_5123]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_5123]
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1241_c7_5123]
signal t16_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_5123]
signal n16_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1244_c11_f5da]
signal BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal t16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1244_c7_abfa]
signal n16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1245_c3_fd72]
signal BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1248_c11_23d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1248_c7_94bc]
signal n16_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_d9ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1251_c7_d812]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1251_c7_d812]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_d812]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_d812]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_d812]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_d812]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_d812]
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1251_c7_d812]
signal n16_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1256_c11_467c]
signal BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1256_c7_9044]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1256_c7_9044]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1256_c7_9044]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1256_c7_9044]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1256_c7_9044]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1256_c7_9044]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1256_c7_9044]
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1256_c7_9044]
signal n16_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1259_c11_3aa1]
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1259_c7_1f9c]
signal n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1260_c3_e85b]
signal BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1263_c32_f4fc]
signal BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1263_c32_0321]
signal BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1263_c32_75f0]
signal MUX_uxn_opcodes_h_l1263_c32_75f0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1263_c32_75f0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1263_c32_75f0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1263_c32_75f0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_d7ea]
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_ce38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_ce38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_ce38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_ce38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_ce38]
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1269_c24_7972]
signal BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1269_c24_4eaf]
signal MUX_uxn_opcodes_h_l1269_c24_4eaf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1269_c24_4eaf_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1269_c24_4eaf_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1269_c24_4eaf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1271_c11_a2f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1271_c7_5b72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1271_c7_5b72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418
BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_left,
BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_right,
BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642
result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642
result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- t16_MUX_uxn_opcodes_h_l1227_c2_4642
t16_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
t16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
t16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
t16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- n16_MUX_uxn_opcodes_h_l1227_c2_4642
n16_MUX_uxn_opcodes_h_l1227_c2_4642 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1227_c2_4642_cond,
n16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue,
n16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse,
n16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

-- printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038
printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038 : entity work.printf_uxn_opcodes_h_l1228_c3_0038_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1
result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- t16_MUX_uxn_opcodes_h_l1233_c7_dfb1
t16_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_dfb1
n16_MUX_uxn_opcodes_h_l1233_c7_dfb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_left,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_right,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501
result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- t16_MUX_uxn_opcodes_h_l1236_c7_3501
t16_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
t16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
t16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
t16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- n16_MUX_uxn_opcodes_h_l1236_c7_3501
n16_MUX_uxn_opcodes_h_l1236_c7_3501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1236_c7_3501_cond,
n16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue,
n16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse,
n16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- t16_MUX_uxn_opcodes_h_l1241_c7_5123
t16_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
t16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
t16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
t16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_5123
n16_MUX_uxn_opcodes_h_l1241_c7_5123 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_5123_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_left,
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_right,
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa
result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa
result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa
result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- t16_MUX_uxn_opcodes_h_l1244_c7_abfa
t16_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
t16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- n16_MUX_uxn_opcodes_h_l1244_c7_abfa
n16_MUX_uxn_opcodes_h_l1244_c7_abfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond,
n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue,
n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse,
n16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72
BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_left,
BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_right,
BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8
BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc
result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1248_c7_94bc
n16_MUX_uxn_opcodes_h_l1248_c7_94bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1248_c7_94bc_cond,
n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue,
n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse,
n16_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812
result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812
result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- n16_MUX_uxn_opcodes_h_l1251_c7_d812
n16_MUX_uxn_opcodes_h_l1251_c7_d812 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1251_c7_d812_cond,
n16_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue,
n16_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse,
n16_MUX_uxn_opcodes_h_l1251_c7_d812_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_left,
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_right,
BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044
result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044
result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- n16_MUX_uxn_opcodes_h_l1256_c7_9044
n16_MUX_uxn_opcodes_h_l1256_c7_9044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1256_c7_9044_cond,
n16_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue,
n16_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse,
n16_MUX_uxn_opcodes_h_l1256_c7_9044_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_left,
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_right,
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c
result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c
result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- n16_MUX_uxn_opcodes_h_l1259_c7_1f9c
n16_MUX_uxn_opcodes_h_l1259_c7_1f9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond,
n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue,
n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse,
n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b
BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_left,
BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_right,
BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc
BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_left,
BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_right,
BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321
BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_left,
BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_right,
BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_return_output);

-- MUX_uxn_opcodes_h_l1263_c32_75f0
MUX_uxn_opcodes_h_l1263_c32_75f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1263_c32_75f0_cond,
MUX_uxn_opcodes_h_l1263_c32_75f0_iftrue,
MUX_uxn_opcodes_h_l1263_c32_75f0_iffalse,
MUX_uxn_opcodes_h_l1263_c32_75f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_left,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_right,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_cond,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972
BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_left,
BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_right,
BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_return_output);

-- MUX_uxn_opcodes_h_l1269_c24_4eaf
MUX_uxn_opcodes_h_l1269_c24_4eaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1269_c24_4eaf_cond,
MUX_uxn_opcodes_h_l1269_c24_4eaf_iftrue,
MUX_uxn_opcodes_h_l1269_c24_4eaf_iffalse,
MUX_uxn_opcodes_h_l1269_c24_4eaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 t16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 n16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 t16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 n16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 t16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 t16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 n16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 n16_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 n16_MUX_uxn_opcodes_h_l1251_c7_d812_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 n16_MUX_uxn_opcodes_h_l1256_c7_9044_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_return_output,
 MUX_uxn_opcodes_h_l1263_c32_75f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_return_output,
 MUX_uxn_opcodes_h_l1269_c24_4eaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_dffe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_7ccd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_fdae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1242_c3_03b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_c494 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1249_c3_37b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_37ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1257_c3_b4c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_9a85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1252_l1245_l1260_DUPLICATE_9238_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1259_l1265_DUPLICATE_a8e8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1276_l1223_DUPLICATE_fc3e_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_c494 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_c494;
     VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_9a85 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_9a85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1257_c3_b4c9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1257_c3_b4c9;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_7ccd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_7ccd;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_dffe := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_dffe;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1249_c3_37b8 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1249_c3_37b8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_fdae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_fdae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_37ec := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_37ec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_iffalse := resize(to_signed(-3, 3), 8);
     VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1242_c3_03b1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1242_c3_03b1;
     VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1256_c11_467c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1259_l1265_DUPLICATE_a8e8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1259_l1265_DUPLICATE_a8e8_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1252_l1245_l1260_DUPLICATE_9238 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1252_l1245_l1260_DUPLICATE_9238_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_fdc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1259_c11_3aa1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1271_c11_a2f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1227_c6_6418] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_left;
     BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output := BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_2aea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_d7ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_d9ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1263_c32_f4fc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_left;
     BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_return_output := BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1248_c11_23d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_d310] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1269_c24_7972] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_left;
     BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_return_output := BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1244_c11_f5da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1263_c32_f4fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1227_c6_6418_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_2aea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_fdc3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d310_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_f5da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c11_23d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_d9ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1256_c11_467c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_3aa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d7ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1271_c11_a2f9_return_output;
     VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1269_c24_7972_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1252_l1245_l1260_DUPLICATE_9238_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1252_l1245_l1260_DUPLICATE_9238_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1252_l1245_l1260_DUPLICATE_9238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1256_l1251_l1244_DUPLICATE_9959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1271_l1259_l1265_l1256_l1251_l1244_DUPLICATE_7375_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1265_l1256_l1251_l1244_DUPLICATE_df9c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1233_l1259_l1256_l1251_l1244_DUPLICATE_052a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1271_l1259_l1256_l1251_l1244_DUPLICATE_32ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1259_l1265_DUPLICATE_a8e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1259_l1265_DUPLICATE_a8e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1248_l1241_l1236_l1227_l1233_l1259_l1265_l1256_l1251_l1244_DUPLICATE_d29c_return_output;
     -- MUX[uxn_opcodes_h_l1269_c24_4eaf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1269_c24_4eaf_cond <= VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_cond;
     MUX_uxn_opcodes_h_l1269_c24_4eaf_iftrue <= VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_iftrue;
     MUX_uxn_opcodes_h_l1269_c24_4eaf_iffalse <= VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_return_output := MUX_uxn_opcodes_h_l1269_c24_4eaf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1271_c7_5b72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1263_c32_0321] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_left;
     BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_return_output := BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_ce38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1271_c7_5b72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1245_c3_fd72] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_left;
     BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_return_output := BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1260_c3_e85b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_left;
     BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_return_output := BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1227_c1_d8bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_ce38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1263_c32_0321_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_fd72_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1260_c3_e85b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1253_DUPLICATE_606e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue := VAR_MUX_uxn_opcodes_h_l1269_c24_4eaf_return_output;
     VAR_printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1227_c1_d8bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1271_c7_5b72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- printf_uxn_opcodes_h_l1228_c3_0038[uxn_opcodes_h_l1228_c3_0038] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1228_c3_0038_uxn_opcodes_h_l1228_c3_0038_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_ce38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_ce38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;

     -- n16_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- MUX[uxn_opcodes_h_l1263_c32_75f0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1263_c32_75f0_cond <= VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_cond;
     MUX_uxn_opcodes_h_l1263_c32_75f0_iftrue <= VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_iftrue;
     MUX_uxn_opcodes_h_l1263_c32_75f0_iffalse <= VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_return_output := MUX_uxn_opcodes_h_l1263_c32_75f0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := t16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_ce38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output := result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue := VAR_MUX_uxn_opcodes_h_l1263_c32_75f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_ce38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- t16_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     t16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     t16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := t16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1259_c7_1f9c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     n16_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     n16_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := n16_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1259_c7_1f9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     t16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     t16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := t16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1256_c7_9044] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;

     -- n16_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     n16_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     n16_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := n16_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1256_c7_9044_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- n16_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := n16_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- t16_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_d812] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_d812_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1248_c7_94bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     t16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     t16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := t16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- n16_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := n16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c7_94bc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1244_c7_abfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1244_c7_abfa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_5123] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;

     -- n16_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     n16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     n16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := n16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_5123_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1236_c7_3501] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_return_output := result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;

     -- n16_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c7_3501_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     n16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     n16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := n16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1233_c7_dfb1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1233_c7_dfb1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1227_c2_4642] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1276_l1223_DUPLICATE_fc3e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1276_l1223_DUPLICATE_fc3e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1227_c2_4642_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1227_c2_4642_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1276_l1223_DUPLICATE_fc3e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1276_l1223_DUPLICATE_fc3e_return_output;
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
