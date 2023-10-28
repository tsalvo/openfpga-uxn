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
-- Submodules: 75
entity jcn2_0CLK_f91b0bf2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_f91b0bf2;
architecture arch of jcn2_0CLK_f91b0bf2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l726_c6_00a5]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l726_c1_db61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal t16_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l726_c2_ff9b]
signal n8_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l727_c3_6126[uxn_opcodes_h_l727_c3_6126]
signal printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l731_c11_6511]
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal t16_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l731_c7_a4d0]
signal n8_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c11_f9a6]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l734_c7_5a47]
signal t16_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_5a47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_5a47]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_5a47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_5a47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l734_c7_5a47]
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_5a47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l734_c7_5a47]
signal n8_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l736_c3_cffd]
signal CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l739_c11_ff60]
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal t16_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l739_c7_3ddb]
signal n8_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l742_c11_6d34]
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l742_c7_6980]
signal t16_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c7_6980]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l742_c7_6980]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c7_6980]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l742_c7_6980]
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l742_c7_6980]
signal result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c7_6980]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l742_c7_6980]
signal n8_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l743_c3_9b11]
signal BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l746_c11_7cc3]
signal BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l746_c7_97b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l746_c7_97b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l746_c7_97b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l746_c7_97b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l746_c7_97b9]
signal result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l746_c7_97b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l746_c7_97b9]
signal n8_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c11_969e]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l749_c7_2abf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_2abf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_2abf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l749_c7_2abf]
signal result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_2abf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l749_c7_2abf]
signal n8_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l752_c30_b928]
signal sp_relative_shift_uxn_opcodes_h_l752_c30_b928_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l752_c30_b928_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l752_c30_b928_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l752_c30_b928_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l753_c26_7b2b]
signal BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l753_c26_e20e]
signal MUX_uxn_opcodes_h_l753_c26_e20e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l753_c26_e20e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l753_c26_e20e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l753_c26_e20e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l754_c22_1d9b]
signal BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l754_c22_c6a8]
signal MUX_uxn_opcodes_h_l754_c22_c6a8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l754_c22_c6a8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l754_c22_c6a8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l754_c22_c6a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l756_c11_6aca]
signal BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l756_c7_6b22]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l756_c7_6b22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l756_c7_6b22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8040( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5
BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c2_ff9b
t16_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
t16_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b
result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b
result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- n8_MUX_uxn_opcodes_h_l726_c2_ff9b
n8_MUX_uxn_opcodes_h_l726_c2_ff9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l726_c2_ff9b_cond,
n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue,
n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse,
n8_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

-- printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126
printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126 : entity work.printf_uxn_opcodes_h_l727_c3_6126_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_left,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_right,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output);

-- t16_MUX_uxn_opcodes_h_l731_c7_a4d0
t16_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
t16_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0
result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0
result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- n8_MUX_uxn_opcodes_h_l731_c7_a4d0
n8_MUX_uxn_opcodes_h_l731_c7_a4d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l731_c7_a4d0_cond,
n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue,
n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse,
n8_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6
BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output);

-- t16_MUX_uxn_opcodes_h_l734_c7_5a47
t16_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
t16_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
t16_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
t16_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47
result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- n8_MUX_uxn_opcodes_h_l734_c7_5a47
n8_MUX_uxn_opcodes_h_l734_c7_5a47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l734_c7_5a47_cond,
n8_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue,
n8_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse,
n8_MUX_uxn_opcodes_h_l734_c7_5a47_return_output);

-- CONST_SL_8_uxn_opcodes_h_l736_c3_cffd
CONST_SL_8_uxn_opcodes_h_l736_c3_cffd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_x,
CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60
BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_left,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_right,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output);

-- t16_MUX_uxn_opcodes_h_l739_c7_3ddb
t16_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
t16_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb
result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb
result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- n8_MUX_uxn_opcodes_h_l739_c7_3ddb
n8_MUX_uxn_opcodes_h_l739_c7_3ddb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l739_c7_3ddb_cond,
n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue,
n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse,
n8_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34
BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_left,
BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_right,
BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output);

-- t16_MUX_uxn_opcodes_h_l742_c7_6980
t16_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l742_c7_6980_cond,
t16_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
t16_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
t16_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980
result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_cond,
result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- n8_MUX_uxn_opcodes_h_l742_c7_6980
n8_MUX_uxn_opcodes_h_l742_c7_6980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l742_c7_6980_cond,
n8_MUX_uxn_opcodes_h_l742_c7_6980_iftrue,
n8_MUX_uxn_opcodes_h_l742_c7_6980_iffalse,
n8_MUX_uxn_opcodes_h_l742_c7_6980_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11
BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_left,
BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_right,
BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_left,
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_right,
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9
result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9
result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output);

-- n8_MUX_uxn_opcodes_h_l746_c7_97b9
n8_MUX_uxn_opcodes_h_l746_c7_97b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l746_c7_97b9_cond,
n8_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue,
n8_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse,
n8_MUX_uxn_opcodes_h_l746_c7_97b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e
BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf
result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf
result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_cond,
result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output);

-- n8_MUX_uxn_opcodes_h_l749_c7_2abf
n8_MUX_uxn_opcodes_h_l749_c7_2abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l749_c7_2abf_cond,
n8_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue,
n8_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse,
n8_MUX_uxn_opcodes_h_l749_c7_2abf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l752_c30_b928
sp_relative_shift_uxn_opcodes_h_l752_c30_b928 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l752_c30_b928_ins,
sp_relative_shift_uxn_opcodes_h_l752_c30_b928_x,
sp_relative_shift_uxn_opcodes_h_l752_c30_b928_y,
sp_relative_shift_uxn_opcodes_h_l752_c30_b928_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b
BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_left,
BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_right,
BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_return_output);

-- MUX_uxn_opcodes_h_l753_c26_e20e
MUX_uxn_opcodes_h_l753_c26_e20e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l753_c26_e20e_cond,
MUX_uxn_opcodes_h_l753_c26_e20e_iftrue,
MUX_uxn_opcodes_h_l753_c26_e20e_iffalse,
MUX_uxn_opcodes_h_l753_c26_e20e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b
BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_left,
BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_right,
BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_return_output);

-- MUX_uxn_opcodes_h_l754_c22_c6a8
MUX_uxn_opcodes_h_l754_c22_c6a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l754_c22_c6a8_cond,
MUX_uxn_opcodes_h_l754_c22_c6a8_iftrue,
MUX_uxn_opcodes_h_l754_c22_c6a8_iffalse,
MUX_uxn_opcodes_h_l754_c22_c6a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca
BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_left,
BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_right,
BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_return_output,
 t16_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 n8_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output,
 t16_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 n8_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output,
 t16_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 n8_MUX_uxn_opcodes_h_l734_c7_5a47_return_output,
 CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output,
 t16_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 n8_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output,
 t16_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 n8_MUX_uxn_opcodes_h_l742_c7_6980_return_output,
 BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output,
 n8_MUX_uxn_opcodes_h_l746_c7_97b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output,
 n8_MUX_uxn_opcodes_h_l749_c7_2abf_return_output,
 sp_relative_shift_uxn_opcodes_h_l752_c30_b928_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_return_output,
 MUX_uxn_opcodes_h_l753_c26_e20e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_return_output,
 MUX_uxn_opcodes_h_l754_c22_c6a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_8115 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_b87e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l737_c3_3fc6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_094e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l744_c3_1db1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_220f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l746_c7_97b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l753_c26_e20e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l753_c26_e20e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l753_c26_e20e_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l753_c26_e20e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l743_l735_DUPLICATE_4f8e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l721_l762_DUPLICATE_7c11_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l753_c26_e20e_iffalse := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_8115 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l728_c3_8115;
     VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l744_c3_1db1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l744_c3_1db1;
     VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_220f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_220f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_b87e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_b87e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l737_c3_3fc6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l737_c3_3fc6;
     VAR_MUX_uxn_opcodes_h_l753_c26_e20e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_094e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_094e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_left := t16;
     VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l753_c26_7b2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c6_00a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c11_969e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l734_c11_f9a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l752_c30_b928] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l752_c30_b928_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_ins;
     sp_relative_shift_uxn_opcodes_h_l752_c30_b928_x <= VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_x;
     sp_relative_shift_uxn_opcodes_h_l752_c30_b928_y <= VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_return_output := sp_relative_shift_uxn_opcodes_h_l752_c30_b928_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l746_c11_7cc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l731_c11_6511] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_left;
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output := BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l743_l735_DUPLICATE_4f8e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l743_l735_DUPLICATE_4f8e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l742_c11_6d34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_left;
     BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output := BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l754_c22_1d9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l739_c11_ff60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_left;
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output := BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l746_c7_97b9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l756_c11_6aca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_left;
     BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output := BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c6_00a5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_6511_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_f9a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_ff60_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_6d34_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7cc3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_969e_return_output;
     VAR_MUX_uxn_opcodes_h_l753_c26_e20e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c26_7b2b_return_output;
     VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c22_1d9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_6aca_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l743_l735_DUPLICATE_4f8e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l743_l735_DUPLICATE_4f8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_fa03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l726_l749_l746_l742_l739_l734_l731_DUPLICATE_b550_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l756_l749_l746_l742_l739_l734_l731_DUPLICATE_85e5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_4f13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l756_l726_l746_l742_l739_l734_l731_DUPLICATE_f90b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l746_c7_97b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l752_c30_b928_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l756_c7_6b22] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l726_c1_db61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l743_c3_9b11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_left;
     BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_return_output := BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_2abf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l756_c7_6b22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_return_output;

     -- MUX[uxn_opcodes_h_l753_c26_e20e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l753_c26_e20e_cond <= VAR_MUX_uxn_opcodes_h_l753_c26_e20e_cond;
     MUX_uxn_opcodes_h_l753_c26_e20e_iftrue <= VAR_MUX_uxn_opcodes_h_l753_c26_e20e_iftrue;
     MUX_uxn_opcodes_h_l753_c26_e20e_iffalse <= VAR_MUX_uxn_opcodes_h_l753_c26_e20e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l753_c26_e20e_return_output := MUX_uxn_opcodes_h_l753_c26_e20e_return_output;

     -- n8_MUX[uxn_opcodes_h_l749_c7_2abf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l749_c7_2abf_cond <= VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_cond;
     n8_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue;
     n8_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_return_output := n8_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l756_c7_6b22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_return_output;

     -- MUX[uxn_opcodes_h_l754_c22_c6a8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l754_c22_c6a8_cond <= VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_cond;
     MUX_uxn_opcodes_h_l754_c22_c6a8_iftrue <= VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_iftrue;
     MUX_uxn_opcodes_h_l754_c22_c6a8_iffalse <= VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_return_output := MUX_uxn_opcodes_h_l754_c22_c6a8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l736_c3_cffd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_return_output := CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l743_c3_9b11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l736_c3_cffd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue := VAR_MUX_uxn_opcodes_h_l753_c26_e20e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue := VAR_MUX_uxn_opcodes_h_l754_c22_c6a8_return_output;
     VAR_printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l726_c1_db61_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_6b22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_6b22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_6b22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_2abf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l749_c7_2abf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;

     -- printf_uxn_opcodes_h_l727_c3_6126[uxn_opcodes_h_l727_c3_6126] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l727_c3_6126_uxn_opcodes_h_l727_c3_6126_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u16_value_MUX[uxn_opcodes_h_l749_c7_2abf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_return_output := result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;

     -- n8_MUX[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l746_c7_97b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_cond;
     n8_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue;
     n8_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_return_output := n8_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     t16_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     t16_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_return_output := t16_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_2abf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := VAR_n8_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l749_c7_2abf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     n8_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     n8_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_return_output := n8_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := t16_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l746_c7_97b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l746_c7_97b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_t16_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_return_output := result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- n8_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := n8_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c7_6980] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- t16_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     t16_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     t16_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := t16_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_n8_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l742_c7_6980_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- t16_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := t16_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- n8_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     n8_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     n8_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := n8_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_3ddb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_3ddb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- t16_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := t16_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- n8_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := n8_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_5a47] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_5a47_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- n8_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := n8_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l731_c7_a4d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_a4d0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c2_ff9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l721_l762_DUPLICATE_7c11 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l721_l762_DUPLICATE_7c11_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8040(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c2_ff9b_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l721_l762_DUPLICATE_7c11_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8040_uxn_opcodes_h_l721_l762_DUPLICATE_7c11_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
