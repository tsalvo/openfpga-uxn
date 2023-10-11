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
-- Submodules: 98
entity neq2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_5ccafc54;
architecture arch of neq2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1379_c6_23b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1379_c1_515b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal n16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1379_c2_60e6]
signal t16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1380_c3_1815[uxn_opcodes_h_l1380_c3_1815]
signal printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_dae0]
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1384_c7_408f]
signal n16_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_408f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_408f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_408f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_408f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_408f]
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_408f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1384_c7_408f]
signal t16_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_c2d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal n16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1387_c7_4de9]
signal t16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_afce]
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1392_c7_6ca2]
signal t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1395_c11_181f]
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1395_c7_485d]
signal n16_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c7_485d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c7_485d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c7_485d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c7_485d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1395_c7_485d]
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1395_c7_485d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1395_c7_485d]
signal t16_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1396_c3_2e0d]
signal BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_4ca2]
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1399_c7_85e3]
signal n16_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_85e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_85e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_85e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_85e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_85e3]
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_85e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1402_c11_1840]
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1402_c7_ccd9]
signal n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c7_ccd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c7_ccd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c7_ccd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c7_ccd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1402_c7_ccd9]
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c7_ccd9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_7aad]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1407_c7_0884]
signal n16_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_0884]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_0884]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_0884]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_0884]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1407_c7_0884]
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_0884]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_8bab]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1410_c7_c009]
signal n16_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_c009]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_c009]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_c009]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_c009]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1410_c7_c009]
signal result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_c009]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1411_c3_60b7]
signal BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1413_c32_98d0]
signal BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1413_c32_43bf]
signal BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1413_c32_f2b3]
signal MUX_uxn_opcodes_h_l1413_c32_f2b3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1413_c32_f2b3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1413_c32_f2b3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1413_c32_f2b3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_e365]
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_1200]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_1200]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_1200]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1415_c7_1200]
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1415_c7_1200]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1419_c24_7446]
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1419_c24_f9ed]
signal MUX_uxn_opcodes_h_l1419_c24_f9ed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1419_c24_f9ed_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1419_c24_f9ed_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1419_c24_f9ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_5210]
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_c42d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_c42d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5
BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_return_output);

-- n16_MUX_uxn_opcodes_h_l1379_c2_60e6
n16_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
n16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6
result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- t16_MUX_uxn_opcodes_h_l1379_c2_60e6
t16_MUX_uxn_opcodes_h_l1379_c2_60e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond,
t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue,
t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse,
t16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

-- printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815
printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815 : entity work.printf_uxn_opcodes_h_l1380_c3_1815_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_left,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_right,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output);

-- n16_MUX_uxn_opcodes_h_l1384_c7_408f
n16_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
n16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
n16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
n16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- t16_MUX_uxn_opcodes_h_l1384_c7_408f
t16_MUX_uxn_opcodes_h_l1384_c7_408f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1384_c7_408f_cond,
t16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue,
t16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse,
t16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output);

-- n16_MUX_uxn_opcodes_h_l1387_c7_4de9
n16_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
n16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- t16_MUX_uxn_opcodes_h_l1387_c7_4de9
t16_MUX_uxn_opcodes_h_l1387_c7_4de9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond,
t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue,
t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse,
t16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_left,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_right,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output);

-- n16_MUX_uxn_opcodes_h_l1392_c7_6ca2
n16_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- t16_MUX_uxn_opcodes_h_l1392_c7_6ca2
t16_MUX_uxn_opcodes_h_l1392_c7_6ca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond,
t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue,
t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse,
t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_left,
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_right,
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output);

-- n16_MUX_uxn_opcodes_h_l1395_c7_485d
n16_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
n16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
n16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
n16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d
result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- t16_MUX_uxn_opcodes_h_l1395_c7_485d
t16_MUX_uxn_opcodes_h_l1395_c7_485d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1395_c7_485d_cond,
t16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue,
t16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse,
t16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d
BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_left,
BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_right,
BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_left,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_right,
BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output);

-- n16_MUX_uxn_opcodes_h_l1399_c7_85e3
n16_MUX_uxn_opcodes_h_l1399_c7_85e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1399_c7_85e3_cond,
n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue,
n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse,
n16_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_left,
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_right,
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output);

-- n16_MUX_uxn_opcodes_h_l1402_c7_ccd9
n16_MUX_uxn_opcodes_h_l1402_c7_ccd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond,
n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue,
n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse,
n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output);

-- n16_MUX_uxn_opcodes_h_l1407_c7_0884
n16_MUX_uxn_opcodes_h_l1407_c7_0884 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1407_c7_0884_cond,
n16_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue,
n16_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse,
n16_MUX_uxn_opcodes_h_l1407_c7_0884_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_cond,
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output);

-- n16_MUX_uxn_opcodes_h_l1410_c7_c009
n16_MUX_uxn_opcodes_h_l1410_c7_c009 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1410_c7_c009_cond,
n16_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue,
n16_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse,
n16_MUX_uxn_opcodes_h_l1410_c7_c009_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009
result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_cond,
result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7
BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_left,
BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_right,
BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0
BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_left,
BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_right,
BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf
BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_left,
BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_right,
BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_return_output);

-- MUX_uxn_opcodes_h_l1413_c32_f2b3
MUX_uxn_opcodes_h_l1413_c32_f2b3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1413_c32_f2b3_cond,
MUX_uxn_opcodes_h_l1413_c32_f2b3_iftrue,
MUX_uxn_opcodes_h_l1413_c32_f2b3_iffalse,
MUX_uxn_opcodes_h_l1413_c32_f2b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_left,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_right,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_cond,
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_left,
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_right,
BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_return_output);

-- MUX_uxn_opcodes_h_l1419_c24_f9ed
MUX_uxn_opcodes_h_l1419_c24_f9ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1419_c24_f9ed_cond,
MUX_uxn_opcodes_h_l1419_c24_f9ed_iftrue,
MUX_uxn_opcodes_h_l1419_c24_f9ed_iffalse,
MUX_uxn_opcodes_h_l1419_c24_f9ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_left,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_right,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_return_output,
 n16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 t16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output,
 n16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 t16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output,
 n16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 t16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output,
 n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output,
 n16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 t16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output,
 n16_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output,
 n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output,
 n16_MUX_uxn_opcodes_h_l1407_c7_0884_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output,
 n16_MUX_uxn_opcodes_h_l1410_c7_c009_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_return_output,
 MUX_uxn_opcodes_h_l1413_c32_f2b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_return_output,
 MUX_uxn_opcodes_h_l1419_c24_f9ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1381_c3_1d7b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_42b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_5e58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1393_c3_9490 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_21e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1400_c3_1504 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_d522 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_b455 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_dacf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1403_l1396_l1388_l1411_DUPLICATE_a9bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1415_DUPLICATE_7111_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1426_l1375_DUPLICATE_5d53_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_d522 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1405_c3_d522;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1381_c3_1d7b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1381_c3_1d7b;
     VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_21e7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1397_c3_21e7;
     VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_b455 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1408_c3_b455;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_5e58 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1390_c3_5e58;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1393_c3_9490 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1393_c3_9490;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_42b4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1385_c3_42b4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1400_c3_1504 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1400_c3_1504;
     VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_dacf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_dacf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1379_c6_23b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1415_DUPLICATE_7111 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1415_DUPLICATE_7111_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c11_7aad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1395_c11_181f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_8bab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1419_c24_7446] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_left;
     BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_return_output := BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1403_l1396_l1388_l1411_DUPLICATE_a9bb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1403_l1396_l1388_l1411_DUPLICATE_a9bb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1402_c11_1840] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_left;
     BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output := BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_e365] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_left;
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output := BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_afce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1399_c11_4ca2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1413_c32_98d0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_left;
     BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_return_output := BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_c2d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_5210] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_left;
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output := BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_dae0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1413_c32_98d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1379_c6_23b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_dae0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_c2d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_afce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_181f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1399_c11_4ca2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_1840_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c11_7aad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_8bab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e365_return_output;
     VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1419_c24_7446_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_5210_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1403_l1396_l1388_l1411_DUPLICATE_a9bb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1403_l1396_l1388_l1411_DUPLICATE_a9bb_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1403_l1396_l1388_l1411_DUPLICATE_a9bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1387_DUPLICATE_46b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1402_l1399_l1395_l1421_l1392_l1415_l1387_DUPLICATE_1043_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_199c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1421_l1392_l1387_DUPLICATE_0d47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1415_DUPLICATE_7111_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1410_l1415_DUPLICATE_7111_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1410_l1384_l1407_l1379_l1402_l1399_l1395_l1392_l1415_l1387_DUPLICATE_3203_return_output;
     -- MUX[uxn_opcodes_h_l1419_c24_f9ed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1419_c24_f9ed_cond <= VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_cond;
     MUX_uxn_opcodes_h_l1419_c24_f9ed_iftrue <= VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_iftrue;
     MUX_uxn_opcodes_h_l1419_c24_f9ed_iffalse <= VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_return_output := MUX_uxn_opcodes_h_l1419_c24_f9ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_c42d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1413_c32_43bf] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_left;
     BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_return_output := BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1379_c1_515b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1411_c3_60b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_left;
     BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_return_output := BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_1200] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1396_c3_2e0d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_left;
     BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_return_output := BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1415_c7_1200] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_c42d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1413_c32_43bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1396_c3_2e0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1411_c3_60b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1404_l1389_DUPLICATE_87c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue := VAR_MUX_uxn_opcodes_h_l1419_c24_f9ed_return_output;
     VAR_printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1379_c1_515b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_c42d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_1200] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;

     -- n16_MUX[uxn_opcodes_h_l1410_c7_c009] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1410_c7_c009_cond <= VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_cond;
     n16_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue;
     n16_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_return_output := n16_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_c009] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1415_c7_1200] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_return_output := result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_1200] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;

     -- printf_uxn_opcodes_h_l1380_c3_1815[uxn_opcodes_h_l1380_c3_1815] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1380_c3_1815_uxn_opcodes_h_l1380_c3_1815_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1413_c32_f2b3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1413_c32_f2b3_cond <= VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_cond;
     MUX_uxn_opcodes_h_l1413_c32_f2b3_iftrue <= VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_iftrue;
     MUX_uxn_opcodes_h_l1413_c32_f2b3_iffalse <= VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_return_output := MUX_uxn_opcodes_h_l1413_c32_f2b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     t16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     t16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := t16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_c009] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue := VAR_MUX_uxn_opcodes_h_l1413_c32_f2b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1415_c7_1200_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1410_c7_c009] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_return_output := result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;

     -- n16_MUX[uxn_opcodes_h_l1407_c7_0884] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1407_c7_0884_cond <= VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_cond;
     n16_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue;
     n16_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_return_output := n16_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_c009] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c7_0884] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;

     -- t16_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_c009] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_c009] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c7_0884] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1410_c7_c009_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := t16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1407_c7_0884] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_return_output := result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;

     -- n16_MUX[uxn_opcodes_h_l1402_c7_ccd9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond;
     n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue;
     n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output := n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c7_0884] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1402_c7_ccd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c7_0884] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c7_0884] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1402_c7_ccd9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1407_c7_0884_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c7_ccd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     t16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     t16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := t16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c7_ccd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1402_c7_ccd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1399_c7_85e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1399_c7_85e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1399_c7_85e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_cond;
     n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue;
     n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output := n16_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1402_c7_ccd9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1399_c7_85e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1402_c7_ccd9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1399_c7_85e3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     n16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     n16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := n16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := t16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1399_c7_85e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1399_c7_85e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1399_c7_85e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1399_c7_85e3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1395_c7_485d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_485d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := n16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_6ca2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_6ca2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     n16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     n16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := n16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1387_c7_4de9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_4de9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := n16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_408f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1384_c7_408f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1379_c2_60e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1426_l1375_DUPLICATE_5d53 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1426_l1375_DUPLICATE_5d53_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1379_c2_60e6_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1426_l1375_DUPLICATE_5d53_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1426_l1375_DUPLICATE_5d53_return_output;
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
