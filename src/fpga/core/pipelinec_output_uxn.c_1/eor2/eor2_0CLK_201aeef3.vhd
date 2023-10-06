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
-- BIN_OP_EQ[uxn_opcodes_h_l1274_c6_d3d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1274_c1_86de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1274_c2_6959]
signal n16_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1274_c2_6959]
signal t16_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1274_c2_6959]
signal tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1274_c2_6959]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1274_c2_6959]
signal result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1274_c2_6959]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1274_c2_6959]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1274_c2_6959]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1274_c2_6959]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1274_c2_6959]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1275_c3_9c60[uxn_opcodes_h_l1275_c3_9c60]
signal printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1280_c11_945e]
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal n16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal t16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1280_c7_8b27]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1283_c11_0afc]
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal n16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal t16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1283_c7_ae37]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1288_c11_5dc7]
signal BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1288_c7_8787]
signal n16_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1288_c7_8787]
signal t16_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1288_c7_8787]
signal tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1288_c7_8787]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1288_c7_8787]
signal result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1288_c7_8787]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1288_c7_8787]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1288_c7_8787]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1288_c7_8787]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1288_c7_8787]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_62d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal n16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal t16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_c90e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1292_c3_6eae]
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1295_c11_89d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1295_c7_256e]
signal n16_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1295_c7_256e]
signal tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1295_c7_256e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1295_c7_256e]
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c7_256e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c7_256e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c7_256e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c7_256e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1295_c7_256e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_24c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1298_c7_fcb9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_fb90]
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1303_c7_6e5d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_7e3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1306_c7_867f]
signal n16_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1306_c7_867f]
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_867f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_867f]
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_867f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_867f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_867f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_867f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_867f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1307_c3_c75a]
signal BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1308_c11_8c19]
signal BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1311_c32_263c]
signal BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1311_c32_3470]
signal BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1311_c32_abea]
signal MUX_uxn_opcodes_h_l1311_c32_abea_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1311_c32_abea_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1311_c32_abea_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1311_c32_abea_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_4663]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1313_c7_873c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1313_c7_873c]
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_873c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_873c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_873c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_a48e]
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_b7b3]
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_b7b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_b7b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_b7b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1321_c34_8dd2]
signal CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_d382]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_698d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_698d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7
BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_return_output);

-- n16_MUX_uxn_opcodes_h_l1274_c2_6959
n16_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
n16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
n16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
n16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- t16_MUX_uxn_opcodes_h_l1274_c2_6959
t16_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
t16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
t16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
t16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1274_c2_6959
tmp16_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959
result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959
result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959
result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959
result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959
result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959
result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

-- printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60
printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60 : entity work.printf_uxn_opcodes_h_l1275_c3_9c60_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_left,
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_right,
BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output);

-- n16_MUX_uxn_opcodes_h_l1280_c7_8b27
n16_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
n16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- t16_MUX_uxn_opcodes_h_l1280_c7_8b27
t16_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
t16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27
tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_left,
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_right,
BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output);

-- n16_MUX_uxn_opcodes_h_l1283_c7_ae37
n16_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
n16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- t16_MUX_uxn_opcodes_h_l1283_c7_ae37
t16_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
t16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37
tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37
result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_left,
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_right,
BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output);

-- n16_MUX_uxn_opcodes_h_l1288_c7_8787
n16_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
n16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
n16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
n16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- t16_MUX_uxn_opcodes_h_l1288_c7_8787
t16_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
t16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
t16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
t16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1288_c7_8787
tmp16_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787
result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787
result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output);

-- n16_MUX_uxn_opcodes_h_l1291_c7_c90e
n16_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
n16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- t16_MUX_uxn_opcodes_h_l1291_c7_c90e
t16_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
t16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e
tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae
BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_left,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_right,
BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output);

-- n16_MUX_uxn_opcodes_h_l1295_c7_256e
n16_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
n16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
n16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
n16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1295_c7_256e
tmp16_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e
result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_fcb9
n16_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9
tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9
result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9
result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_left,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_right,
BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output);

-- n16_MUX_uxn_opcodes_h_l1303_c7_6e5d
n16_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d
tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output);

-- n16_MUX_uxn_opcodes_h_l1306_c7_867f
n16_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
n16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
n16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
n16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1306_c7_867f
tmp16_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a
BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_left,
BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_right,
BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19
BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_left,
BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_right,
BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c
BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_left,
BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_right,
BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470
BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_left,
BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_right,
BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_return_output);

-- MUX_uxn_opcodes_h_l1311_c32_abea
MUX_uxn_opcodes_h_l1311_c32_abea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1311_c32_abea_cond,
MUX_uxn_opcodes_h_l1311_c32_abea_iftrue,
MUX_uxn_opcodes_h_l1311_c32_abea_iffalse,
MUX_uxn_opcodes_h_l1311_c32_abea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_left,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_right,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2
CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_x,
CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa
CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_return_output,
 n16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 t16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output,
 n16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 t16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output,
 n16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 t16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output,
 n16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 t16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output,
 n16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 t16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output,
 n16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output,
 n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output,
 n16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_return_output,
 MUX_uxn_opcodes_h_l1311_c32_abea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1277_c3_190a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1281_c3_2a9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_9731 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_790f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_c149 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_a7ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_dbbd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_ea45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1311_c32_abea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1311_c32_abea_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1311_c32_abea_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1311_c32_abea_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_aeff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1317_c24_d18b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_e363 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_51c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1284_l1292_l1299_l1307_DUPLICATE_c866_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1319_l1306_DUPLICATE_c7b8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1270_l1328_DUPLICATE_96ba_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_a7ef := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_a7ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_790f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1289_c3_790f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_right := to_unsigned(10, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_ea45 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_ea45;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1281_c3_2a9a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1281_c3_2a9a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_9731 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1286_c3_9731;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_c149 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1293_c3_c149;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_dbbd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1301_c3_dbbd;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_e363 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_e363;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_aeff := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1316_c3_aeff;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1277_c3_190a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1277_c3_190a;
     VAR_MUX_uxn_opcodes_h_l1311_c32_abea_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1311_c32_abea_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1274_c6_d3d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1280_c11_945e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1284_l1292_l1299_l1307_DUPLICATE_c866 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1284_l1292_l1299_l1307_DUPLICATE_c866_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1291_c11_62d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1311_c32_263c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_left;
     BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_return_output := BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1317_c24_d18b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1317_c24_d18b_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1321_c34_8dd2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_return_output := CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1306_c11_7e3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_24c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1303_c11_fb90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_4663] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1288_c11_5dc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_d382] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_a48e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1283_c11_0afc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1319_l1306_DUPLICATE_c7b8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1319_l1306_DUPLICATE_c7b8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1295_c11_89d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1311_c32_263c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1274_c6_d3d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1280_c11_945e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1283_c11_0afc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1288_c11_5dc7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1291_c11_62d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1295_c11_89d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_24c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1303_c11_fb90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1306_c11_7e3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_4663_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_a48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_d382_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1284_l1292_l1299_l1307_DUPLICATE_c866_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1284_l1292_l1299_l1307_DUPLICATE_c866_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1284_l1292_l1299_l1307_DUPLICATE_c866_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1317_c24_d18b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_4f28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1313_l1283_l1306_l1280_l1303_l1298_l1295_l1323_DUPLICATE_6aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1291_l1288_l1313_l1283_l1280_l1303_l1274_l1298_l1295_DUPLICATE_2d22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1291_l1288_l1283_l1306_l1280_l1303_l1298_l1295_DUPLICATE_fd71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_l1323_DUPLICATE_fd45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1319_l1306_DUPLICATE_c7b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1319_l1306_DUPLICATE_c7b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1291_l1319_l1288_l1283_l1306_l1280_l1303_l1274_l1298_l1295_DUPLICATE_32f5_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_698d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_698d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1321_c24_51c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_51c2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1321_c34_8dd2_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1274_c1_86de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1292_c3_6eae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_left;
     BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_return_output := BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1313_c7_873c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1311_c32_3470] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_left;
     BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_return_output := BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_b7b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1307_c3_c75a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_left;
     BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output := BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1311_c32_abea_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1311_c32_3470_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1292_c3_6eae_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1307_c3_c75a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1321_c24_51c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1300_l1285_DUPLICATE_79aa_return_output;
     VAR_printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1274_c1_86de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_698d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_698d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;
     -- n16_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     n16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     n16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := n16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1319_c7_b7b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_873c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1308_c11_8c19] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_left;
     BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_return_output := BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_return_output;

     -- t16_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := t16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- MUX[uxn_opcodes_h_l1311_c32_abea] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1311_c32_abea_cond <= VAR_MUX_uxn_opcodes_h_l1311_c32_abea_cond;
     MUX_uxn_opcodes_h_l1311_c32_abea_iftrue <= VAR_MUX_uxn_opcodes_h_l1311_c32_abea_iftrue;
     MUX_uxn_opcodes_h_l1311_c32_abea_iffalse <= VAR_MUX_uxn_opcodes_h_l1311_c32_abea_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1311_c32_abea_return_output := MUX_uxn_opcodes_h_l1311_c32_abea_return_output;

     -- printf_uxn_opcodes_h_l1275_c3_9c60[uxn_opcodes_h_l1275_c3_9c60] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1275_c3_9c60_uxn_opcodes_h_l1275_c3_9c60_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_b7b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_b7b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1308_c11_8c19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue := VAR_MUX_uxn_opcodes_h_l1311_c32_abea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1319_c7_b7b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     t16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     t16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := t16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_873c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_873c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1313_c7_873c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1313_c7_873c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := t16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1306_c7_867f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1306_c7_867f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     n16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     n16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := n16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := t16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1303_c7_6e5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1303_c7_6e5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     -- n16_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := n16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_fcb9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- t16_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     t16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     t16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := t16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1298_c7_fcb9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     n16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     n16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := n16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1295_c7_256e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1295_c7_256e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1291_c7_c90e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := n16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1291_c7_c90e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- n16_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := n16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1288_c7_8787] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1288_c7_8787_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- n16_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     n16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     n16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := n16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1283_c7_ae37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1283_c7_ae37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1280_c7_8b27] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1280_c7_8b27_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1274_c2_6959] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_return_output := result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1270_l1328_DUPLICATE_96ba LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1270_l1328_DUPLICATE_96ba_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1274_c2_6959_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1274_c2_6959_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1270_l1328_DUPLICATE_96ba_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1270_l1328_DUPLICATE_96ba_return_output;
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
