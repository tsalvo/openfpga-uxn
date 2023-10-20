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
entity neq2_0CLK_27ee032d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_27ee032d;
architecture arch of neq2_0CLK_27ee032d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1353_c6_29a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal n16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1353_c2_efc0]
signal t16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_79a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1358_c7_2128]
signal n16_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_2128]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1358_c7_2128]
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_2128]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_2128]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_2128]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_2128]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1358_c7_2128]
signal t16_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_167a]
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1361_c7_d3ff]
signal t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_1df6]
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1366_c7_a0c3]
signal t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1369_c11_faaf]
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1369_c7_c5f3]
signal t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1370_c3_dd5a]
signal BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_d7da]
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1373_c7_ebf7]
signal n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_ebf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1373_c7_ebf7]
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_ebf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_ebf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_ebf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_ebf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1376_c11_fff2]
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1376_c7_c1f9]
signal n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c7_c1f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1376_c7_c1f9]
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c7_c1f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c7_c1f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c7_c1f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c7_c1f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_fe76]
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1381_c7_c751]
signal n16_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_c751]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1381_c7_c751]
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_c751]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_c751]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_c751]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_c751]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_4fc2]
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1384_c7_3b20]
signal n16_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_3b20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1384_c7_3b20]
signal result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_3b20]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_3b20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_3b20]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_3b20]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1385_c3_4e14]
signal BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1387_c30_937b]
signal sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1390_c21_1711]
signal BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1390_c21_583c]
signal MUX_uxn_opcodes_h_l1390_c21_583c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1390_c21_583c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1390_c21_583c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1390_c21_583c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_529a]
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1392_c7_eadd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_eadd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_eadd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1
BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output);

-- n16_MUX_uxn_opcodes_h_l1353_c2_efc0
n16_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
n16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0
result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- t16_MUX_uxn_opcodes_h_l1353_c2_efc0
t16_MUX_uxn_opcodes_h_l1353_c2_efc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond,
t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue,
t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse,
t16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output);

-- n16_MUX_uxn_opcodes_h_l1358_c7_2128
n16_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
n16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
n16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
n16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- t16_MUX_uxn_opcodes_h_l1358_c7_2128
t16_MUX_uxn_opcodes_h_l1358_c7_2128 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1358_c7_2128_cond,
t16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue,
t16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse,
t16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_left,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_right,
BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output);

-- n16_MUX_uxn_opcodes_h_l1361_c7_d3ff
n16_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff
result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- t16_MUX_uxn_opcodes_h_l1361_c7_d3ff
t16_MUX_uxn_opcodes_h_l1361_c7_d3ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond,
t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue,
t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse,
t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_left,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_right,
BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output);

-- n16_MUX_uxn_opcodes_h_l1366_c7_a0c3
n16_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- t16_MUX_uxn_opcodes_h_l1366_c7_a0c3
t16_MUX_uxn_opcodes_h_l1366_c7_a0c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond,
t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue,
t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse,
t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_left,
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_right,
BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output);

-- n16_MUX_uxn_opcodes_h_l1369_c7_c5f3
n16_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3
result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- t16_MUX_uxn_opcodes_h_l1369_c7_c5f3
t16_MUX_uxn_opcodes_h_l1369_c7_c5f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond,
t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue,
t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse,
t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a
BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_left,
BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_right,
BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_left,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_right,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output);

-- n16_MUX_uxn_opcodes_h_l1373_c7_ebf7
n16_MUX_uxn_opcodes_h_l1373_c7_ebf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond,
n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue,
n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse,
n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_left,
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_right,
BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output);

-- n16_MUX_uxn_opcodes_h_l1376_c7_c1f9
n16_MUX_uxn_opcodes_h_l1376_c7_c1f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond,
n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue,
n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse,
n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9
result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_left,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_right,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output);

-- n16_MUX_uxn_opcodes_h_l1381_c7_c751
n16_MUX_uxn_opcodes_h_l1381_c7_c751 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1381_c7_c751_cond,
n16_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue,
n16_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse,
n16_MUX_uxn_opcodes_h_l1381_c7_c751_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_cond,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_left,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_right,
BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output);

-- n16_MUX_uxn_opcodes_h_l1384_c7_3b20
n16_MUX_uxn_opcodes_h_l1384_c7_3b20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1384_c7_3b20_cond,
n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue,
n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse,
n16_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20
result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_cond,
result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14
BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_left,
BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_right,
BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1387_c30_937b
sp_relative_shift_uxn_opcodes_h_l1387_c30_937b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_ins,
sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_x,
sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_y,
sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711
BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_left,
BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_right,
BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_return_output);

-- MUX_uxn_opcodes_h_l1390_c21_583c
MUX_uxn_opcodes_h_l1390_c21_583c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1390_c21_583c_cond,
MUX_uxn_opcodes_h_l1390_c21_583c_iftrue,
MUX_uxn_opcodes_h_l1390_c21_583c_iffalse,
MUX_uxn_opcodes_h_l1390_c21_583c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_left,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_right,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750
CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output,
 n16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 t16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output,
 n16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 t16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output,
 n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output,
 n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output,
 n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output,
 n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output,
 n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output,
 n16_MUX_uxn_opcodes_h_l1381_c7_c751_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output,
 n16_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output,
 sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_return_output,
 MUX_uxn_opcodes_h_l1390_c21_583c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_3027 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_b592 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_6133 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_1f49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_684a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1374_c3_45cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_2327 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1382_c3_61e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_0f95 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1384_c7_3b20_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1390_c21_583c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1390_c21_583c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1390_c21_583c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1390_c21_583c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1377_l1385_l1362_l1370_DUPLICATE_ec57_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1349_l1398_DUPLICATE_7d09_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1390_c21_583c_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_3027 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1355_c3_3027;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1374_c3_45cf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1374_c3_45cf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_6133 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1364_c3_6133;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_0f95 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1389_c3_0f95;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1382_c3_61e2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1382_c3_61e2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_1f49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_1f49;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_2327 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_2327;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_b592 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1359_c3_b592;
     VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1390_c21_583c_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_684a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_684a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1387_c30_937b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_ins;
     sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_x;
     sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_return_output := sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1361_c11_167a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1369_c11_faaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1366_c11_1df6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_529a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_d7da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1384_c11_4fc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_fe76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_left;
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output := BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1384_c7_3b20_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1353_c6_29a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1376_c11_fff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1377_l1385_l1362_l1370_DUPLICATE_ec57 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1377_l1385_l1362_l1370_DUPLICATE_ec57_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1358_c11_79a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c6_29a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1358_c11_79a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1361_c11_167a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1366_c11_1df6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1369_c11_faaf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_d7da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1376_c11_fff2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_fe76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1384_c11_4fc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_529a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1377_l1385_l1362_l1370_DUPLICATE_ec57_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1377_l1385_l1362_l1370_DUPLICATE_ec57_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1377_l1385_l1362_l1370_DUPLICATE_ec57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_075d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1384_l1358_l1381_l1376_l1373_DUPLICATE_5732_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_5cb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1369_l1366_l1392_l1361_l1358_l1381_l1353_l1376_l1373_DUPLICATE_b81d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1369_l1366_l1361_l1384_l1358_l1381_l1353_l1376_l1373_DUPLICATE_4fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1384_c7_3b20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1387_c30_937b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1392_c7_eadd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1385_c3_4e14] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_left;
     BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output := BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_eadd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_eadd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1370_c3_dd5a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_left;
     BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_return_output := BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1370_c3_dd5a_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1385_c3_4e14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1378_l1363_DUPLICATE_d750_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_eadd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1390_c21_1711] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_left;
     BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_return_output := BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_c751] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;

     -- t16_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1384_c7_3b20_cond <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_cond;
     n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue;
     n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output := n16_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_c751] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1390_c21_583c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1390_c21_1711_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1376_c7_c1f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_c751] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;

     -- t16_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_c751] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;

     -- n16_MUX[uxn_opcodes_h_l1381_c7_c751] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1381_c7_c751_cond <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_cond;
     n16_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue;
     n16_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_return_output := n16_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;

     -- MUX[uxn_opcodes_h_l1390_c21_583c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1390_c21_583c_cond <= VAR_MUX_uxn_opcodes_h_l1390_c21_583c_cond;
     MUX_uxn_opcodes_h_l1390_c21_583c_iftrue <= VAR_MUX_uxn_opcodes_h_l1390_c21_583c_iftrue;
     MUX_uxn_opcodes_h_l1390_c21_583c_iffalse <= VAR_MUX_uxn_opcodes_h_l1390_c21_583c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1390_c21_583c_return_output := MUX_uxn_opcodes_h_l1390_c21_583c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1376_c7_c1f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_c751] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue := VAR_MUX_uxn_opcodes_h_l1390_c21_583c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1376_c7_c1f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1376_c7_c1f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_ebf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1376_c7_c1f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_ebf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1376_c7_c1f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond;
     n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue;
     n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output := n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1384_c7_3b20] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output := result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1384_c7_3b20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     -- t16_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     t16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     t16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := t16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- n16_MUX[uxn_opcodes_h_l1373_c7_ebf7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond;
     n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue;
     n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output := n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_ebf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1381_c7_c751] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_return_output := result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_ebf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_ebf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1381_c7_c751_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := t16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1376_c7_c1f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1376_c7_c1f9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1373_c7_ebf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1373_c7_ebf7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1369_c7_c5f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1369_c7_c5f3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1366_c7_a0c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- n16_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     n16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     n16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := n16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1366_c7_a0c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1361_c7_d3ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := n16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1361_c7_d3ff_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1358_c7_2128] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_return_output := result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1358_c7_2128_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1353_c2_efc0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1349_l1398_DUPLICATE_7d09 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1349_l1398_DUPLICATE_7d09_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1353_c2_efc0_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1349_l1398_DUPLICATE_7d09_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1349_l1398_DUPLICATE_7d09_return_output;
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
