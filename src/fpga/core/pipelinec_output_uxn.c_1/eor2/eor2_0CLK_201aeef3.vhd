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
-- Submodules: 123
entity eor2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_201aeef3;
architecture arch of eor2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1248_c6_d0fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1248_c1_4e44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1248_c2_e9f8]
signal n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1249_c3_051b[uxn_opcodes_h_l1249_c3_051b]
signal printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1254_c11_8650]
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal t16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1254_c7_86dd]
signal n16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_1bb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1257_c7_a505]
signal t16_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1257_c7_a505]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_a505]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_a505]
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_a505]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_a505]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_a505]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_a505]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1257_c7_a505]
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1257_c7_a505]
signal n16_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_06b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1262_c7_864c]
signal t16_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1262_c7_864c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c7_864c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1262_c7_864c]
signal result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c7_864c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_864c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_864c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c7_864c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1262_c7_864c]
signal tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1262_c7_864c]
signal n16_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_d6f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1265_c7_a8a8]
signal n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1266_c3_26b8]
signal BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1269_c11_3b81]
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1269_c7_88ce]
signal n16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1272_c11_879d]
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1272_c7_bdb9]
signal n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_7a73]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c7_5fa0]
signal n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1280_c11_ff57]
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1280_c7_2b25]
signal n16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1281_c3_f369]
signal BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1282_c11_8455]
signal BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1285_c32_da12]
signal BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1285_c32_15cb]
signal BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1285_c32_6ee5]
signal MUX_uxn_opcodes_h_l1285_c32_6ee5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1285_c32_6ee5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1285_c32_6ee5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1285_c32_6ee5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_db3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_b3cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_b3cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_b3cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_b3cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_b3cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_4110]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_442c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1293_c7_442c]
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_442c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_442c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1295_c34_52fe]
signal CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1297_c11_5c22]
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c7_e8fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c7_e8fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa
BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_return_output);

-- t16_MUX_uxn_opcodes_h_l1248_c2_e9f8
t16_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8
result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8
tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- n16_MUX_uxn_opcodes_h_l1248_c2_e9f8
n16_MUX_uxn_opcodes_h_l1248_c2_e9f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond,
n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue,
n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse,
n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

-- printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b
printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b : entity work.printf_uxn_opcodes_h_l1249_c3_051b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_left,
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_right,
BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output);

-- t16_MUX_uxn_opcodes_h_l1254_c7_86dd
t16_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
t16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd
result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd
tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- n16_MUX_uxn_opcodes_h_l1254_c7_86dd
n16_MUX_uxn_opcodes_h_l1254_c7_86dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond,
n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue,
n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse,
n16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output);

-- t16_MUX_uxn_opcodes_h_l1257_c7_a505
t16_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
t16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
t16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
t16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1257_c7_a505
tmp16_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- n16_MUX_uxn_opcodes_h_l1257_c7_a505
n16_MUX_uxn_opcodes_h_l1257_c7_a505 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1257_c7_a505_cond,
n16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue,
n16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse,
n16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output);

-- t16_MUX_uxn_opcodes_h_l1262_c7_864c
t16_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
t16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
t16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
t16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c
result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c
result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1262_c7_864c
tmp16_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- n16_MUX_uxn_opcodes_h_l1262_c7_864c
n16_MUX_uxn_opcodes_h_l1262_c7_864c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1262_c7_864c_cond,
n16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue,
n16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse,
n16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output);

-- t16_MUX_uxn_opcodes_h_l1265_c7_a8a8
t16_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8
tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- n16_MUX_uxn_opcodes_h_l1265_c7_a8a8
n16_MUX_uxn_opcodes_h_l1265_c7_a8a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond,
n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue,
n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse,
n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8
BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_left,
BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_right,
BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_left,
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_right,
BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce
tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- n16_MUX_uxn_opcodes_h_l1269_c7_88ce
n16_MUX_uxn_opcodes_h_l1269_c7_88ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond,
n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue,
n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse,
n16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_left,
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_right,
BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9
result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9
result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9
tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- n16_MUX_uxn_opcodes_h_l1272_c7_bdb9
n16_MUX_uxn_opcodes_h_l1272_c7_bdb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond,
n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue,
n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse,
n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0
tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c7_5fa0
n16_MUX_uxn_opcodes_h_l1277_c7_5fa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond,
n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_left,
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_right,
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25
tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- n16_MUX_uxn_opcodes_h_l1280_c7_2b25
n16_MUX_uxn_opcodes_h_l1280_c7_2b25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond,
n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue,
n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse,
n16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369
BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_left,
BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_right,
BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455
BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_left,
BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_right,
BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12
BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_left,
BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_right,
BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb
BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_left,
BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_right,
BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_return_output);

-- MUX_uxn_opcodes_h_l1285_c32_6ee5
MUX_uxn_opcodes_h_l1285_c32_6ee5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1285_c32_6ee5_cond,
MUX_uxn_opcodes_h_l1285_c32_6ee5_iftrue,
MUX_uxn_opcodes_h_l1285_c32_6ee5_iffalse,
MUX_uxn_opcodes_h_l1285_c32_6ee5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe
CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_x,
CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_left,
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_right,
BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_return_output,
 t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output,
 t16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 n16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output,
 t16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 n16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output,
 t16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 n16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output,
 t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 n16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 n16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_return_output,
 MUX_uxn_opcodes_h_l1285_c32_6ee5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_1b68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_0c33 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_3c15 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_e44c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_a160 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1270_c3_f2ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_e7bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_242f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1290_c3_405d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1291_c24_b222_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_726e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1295_c24_5718_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1258_l1281_l1266_l1273_DUPLICATE_63a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_l1280_DUPLICATE_0470_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1244_l1302_DUPLICATE_c503_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_0c33 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_0c33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_a160 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_a160;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_3c15 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_3c15;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_242f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_242f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1290_c3_405d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1290_c3_405d;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_e7bd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_e7bd;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_e44c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_e44c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1270_c3_f2ba := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1270_c3_f2ba;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_726e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1294_c3_726e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_1b68 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_1b68;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1287_c11_db3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1272_c11_879d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_4110] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_d6f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1297_c11_5c22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_left;
     BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output := BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1258_l1281_l1266_l1273_DUPLICATE_63a1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1258_l1281_l1266_l1273_DUPLICATE_63a1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_1bb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1295_c34_52fe] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_return_output := CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1280_c11_ff57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_left;
     BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output := BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1285_c32_da12] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_left;
     BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_return_output := BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c11_7a73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1269_c11_3b81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_left;
     BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output := BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1254_c11_8650] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_left;
     BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output := BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1291_c24_b222] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1291_c24_b222_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1248_c6_d0fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_l1280_DUPLICATE_0470 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_l1280_DUPLICATE_0470_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_06b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1285_c32_da12_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1248_c6_d0fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c11_8650_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_1bb9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_06b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_d6f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1269_c11_3b81_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1272_c11_879d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c11_7a73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_ff57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1287_c11_db3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_4110_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1297_c11_5c22_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1258_l1281_l1266_l1273_DUPLICATE_63a1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1258_l1281_l1266_l1273_DUPLICATE_63a1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1258_l1281_l1266_l1273_DUPLICATE_63a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1291_c24_b222_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_e56f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1297_l1265_l1293_l1262_l1287_l1257_l1280_DUPLICATE_3e9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1262_l1287_l1257_DUPLICATE_28b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1254_l1277_l1272_l1269_l1265_l1262_l1257_l1280_DUPLICATE_1f72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1297_l1265_l1293_l1262_l1257_l1280_DUPLICATE_04c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_l1280_DUPLICATE_0470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_l1280_DUPLICATE_0470_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1254_l1277_l1248_l1272_l1269_l1265_l1293_l1262_l1257_l1280_DUPLICATE_ad41_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1248_c1_4e44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1287_c7_b3cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1285_c32_15cb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_left;
     BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_return_output := BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1297_c7_e8fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1281_c3_f369] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_left;
     BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output := BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_442c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1295_c24_5718] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1295_c24_5718_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1295_c34_52fe_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1297_c7_e8fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1266_c3_26b8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_left;
     BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_return_output := BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1285_c32_15cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1266_c3_26b8_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1281_c3_f369_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1295_c24_5718_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1259_l1274_DUPLICATE_679d_return_output;
     VAR_printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1248_c1_4e44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1297_c7_e8fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;
     -- printf_uxn_opcodes_h_l1249_c3_051b[uxn_opcodes_h_l1249_c3_051b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1249_c3_051b_uxn_opcodes_h_l1249_c3_051b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1287_c7_b3cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_442c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- MUX[uxn_opcodes_h_l1285_c32_6ee5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1285_c32_6ee5_cond <= VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_cond;
     MUX_uxn_opcodes_h_l1285_c32_6ee5_iftrue <= VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_iftrue;
     MUX_uxn_opcodes_h_l1285_c32_6ee5_iffalse <= VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_return_output := MUX_uxn_opcodes_h_l1285_c32_6ee5_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1282_c11_8455] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_left;
     BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_return_output := BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_442c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := n16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1293_c7_442c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1282_c11_8455_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue := VAR_MUX_uxn_opcodes_h_l1285_c32_6ee5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1293_c7_442c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1287_c7_b3cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1287_c7_b3cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1287_c7_b3cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     t16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     t16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := t16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1287_c7_b3cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     -- t16_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     t16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     t16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := t16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- n16_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1280_c7_2b25] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output := result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_2b25_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := t16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := n16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c7_5fa0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1277_c7_5fa0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- t16_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1272_c7_bdb9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1272_c7_bdb9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- n16_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     n16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     n16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := n16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1269_c7_88ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1269_c7_88ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_a8a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     n16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     n16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := n16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_a8a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := n16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_864c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1262_c7_864c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_a505] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_return_output := result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_a505_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1254_c7_86dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1254_c7_86dd_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1248_c2_e9f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1244_l1302_DUPLICATE_c503 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1244_l1302_DUPLICATE_c503_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1248_c2_e9f8_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1244_l1302_DUPLICATE_c503_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1244_l1302_DUPLICATE_c503_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
