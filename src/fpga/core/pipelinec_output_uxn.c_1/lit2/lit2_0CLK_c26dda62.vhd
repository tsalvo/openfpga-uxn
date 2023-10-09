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
-- Submodules: 73
entity lit2_0CLK_c26dda62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_c26dda62;
architecture arch of lit2_0CLK_c26dda62 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l235_c6_ff9c]
signal BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l235_c1_e7e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l235_c2_e1aa]
signal tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l236_c3_6a1e[uxn_opcodes_h_l236_c3_6a1e]
signal printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l243_c11_4b1d]
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_64ac]
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l243_c7_64ac]
signal tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l247_c11_a017]
signal BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_pc_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l247_c7_987e]
signal result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l247_c7_987e]
signal tmp16_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l249_c3_d149]
signal CONST_SL_8_uxn_opcodes_h_l249_c3_d149_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l249_c3_d149_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l250_c21_cc35]
signal BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l252_c11_8b23]
signal BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_pc_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l252_c7_3692]
signal result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l252_c7_3692]
signal tmp16_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l253_c21_0361]
signal BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l255_c11_e202]
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l255_c7_cbc3]
signal tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l256_c3_de61]
signal BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l259_c15_0509]
signal BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l264_c11_2938]
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_8e4d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l264_c7_8e4d]
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_8e4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_8e4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_8e4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l267_c34_1546]
signal CONST_SR_8_uxn_opcodes_h_l267_c34_1546_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l267_c34_1546_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l269_c11_9dca]
signal BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l269_c7_6c90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l269_c7_6c90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_cb37( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.ram_addr := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c
BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_left,
BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_right,
BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa
result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa
result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa
result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa
result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa
result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa
result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa
result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa
tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_cond,
tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

-- printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e
printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e : entity work.printf_uxn_opcodes_h_l236_c3_6a1e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d
BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_left,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_right,
BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l243_c7_64ac
result_pc_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac
result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l243_c7_64ac
tmp16_MUX_uxn_opcodes_h_l243_c7_64ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_cond,
tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue,
tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse,
tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017
BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_left,
BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_right,
BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output);

-- result_pc_MUX_uxn_opcodes_h_l247_c7_987e
result_pc_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_pc_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e
result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e
result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e
result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e
result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e
result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e
result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l247_c7_987e
tmp16_MUX_uxn_opcodes_h_l247_c7_987e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l247_c7_987e_cond,
tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iftrue,
tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iffalse,
tmp16_MUX_uxn_opcodes_h_l247_c7_987e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l249_c3_d149
CONST_SL_8_uxn_opcodes_h_l249_c3_d149 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l249_c3_d149_x,
CONST_SL_8_uxn_opcodes_h_l249_c3_d149_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35
BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_left,
BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_right,
BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23
BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_left,
BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_right,
BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output);

-- result_pc_MUX_uxn_opcodes_h_l252_c7_3692
result_pc_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_pc_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692
result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692
result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692
result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_cond,
result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- tmp16_MUX_uxn_opcodes_h_l252_c7_3692
tmp16_MUX_uxn_opcodes_h_l252_c7_3692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l252_c7_3692_cond,
tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iftrue,
tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iffalse,
tmp16_MUX_uxn_opcodes_h_l252_c7_3692_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361
BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_left,
BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_right,
BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202
BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_left,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_right,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3
result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3
result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3
result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3
result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3
tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_cond,
tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue,
tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse,
tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l256_c3_de61
BIN_OP_OR_uxn_opcodes_h_l256_c3_de61 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_left,
BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_right,
BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509
BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_left,
BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_right,
BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_left,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_right,
BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d
result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_cond,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l267_c34_1546
CONST_SR_8_uxn_opcodes_h_l267_c34_1546 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l267_c34_1546_x,
CONST_SR_8_uxn_opcodes_h_l267_c34_1546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca
BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_left,
BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_right,
BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90
result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90
result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_return_output,
 result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output,
 result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output,
 result_pc_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 tmp16_MUX_uxn_opcodes_h_l247_c7_987e_return_output,
 CONST_SL_8_uxn_opcodes_h_l249_c3_d149_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output,
 result_pc_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 tmp16_MUX_uxn_opcodes_h_l252_c7_3692_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output,
 CONST_SR_8_uxn_opcodes_h_l267_c34_1546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l238_c3_4aee : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l235_c2_e1aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_64ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l250_c3_6db5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l249_c3_d149_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l249_c3_d149_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l253_c3_8279 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l252_c7_3692_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l259_c3_298b : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l261_c3_3a2f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l262_c24_d085_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l266_c3_8bf3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l267_c34_1546_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l267_c34_1546_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l267_c24_5482_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l243_l252_l255_l247_DUPLICATE_dbdd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l256_l248_DUPLICATE_511c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l274_l230_DUPLICATE_fa55_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l266_c3_8bf3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l266_c3_8bf3;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l261_c3_3a2f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l261_c3_3a2f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l238_c3_4aee := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l238_c3_4aee;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_right := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l267_c34_1546_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l235_c6_ff9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l252_c7_3692_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l250_c21_cc35] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_left;
     BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_return_output := BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l253_c21_0361] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_left;
     BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_return_output := BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l252_c11_8b23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_left;
     BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output := BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l243_c11_4b1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l269_c11_9dca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_left;
     BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output := BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_64ac_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l259_c15_0509] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_left;
     BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_return_output := BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l264_c11_2938] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_left;
     BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output := BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l247_c11_a017] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_left;
     BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output := BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l243_l252_l255_l247_DUPLICATE_dbdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l243_l252_l255_l247_DUPLICATE_dbdd_return_output := result.is_ram_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l256_l248_DUPLICATE_511c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l256_l248_DUPLICATE_511c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output := result.is_opc_done;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l235_c2_e1aa_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l255_c11_e202] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_left;
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output := BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l267_c34_1546] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l267_c34_1546_x <= VAR_CONST_SR_8_uxn_opcodes_h_l267_c34_1546_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l267_c34_1546_return_output := CONST_SR_8_uxn_opcodes_h_l267_c34_1546_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l235_c6_ff9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l243_c11_4b1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l247_c11_a017_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l252_c11_8b23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_e202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l264_c11_2938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l269_c11_9dca_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l250_c3_6db5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l250_c21_cc35_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l253_c3_8279 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l253_c21_0361_return_output, 16);
     VAR_result_pc_uxn_opcodes_h_l259_c3_298b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l259_c15_0509_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l256_l248_DUPLICATE_511c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l249_c3_d149_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l256_l248_DUPLICATE_511c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l235_l252_l247_l243_l255_DUPLICATE_e5f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l252_l247_l269_l243_l264_l255_DUPLICATE_64a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_ab7d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l243_l252_l255_l247_DUPLICATE_dbdd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l243_l252_l255_l247_DUPLICATE_dbdd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l243_l252_l255_l247_DUPLICATE_dbdd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l243_l252_l255_l247_DUPLICATE_dbdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l235_l252_l247_l269_l243_l264_DUPLICATE_592f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_5526_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l235_l252_l247_l243_l264_DUPLICATE_a7ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l235_c2_e1aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := VAR_result_pc_uxn_opcodes_h_l259_c3_298b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l250_c3_6db5;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l253_c3_8279;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l269_c7_6c90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l264_c7_8e4d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l264_c7_8e4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l256_c3_de61] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_left;
     BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output := BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l235_c1_e7e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l267_c24_5482] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l267_c24_5482_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l267_c34_1546_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l249_c3_d149] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l249_c3_d149_x <= VAR_CONST_SL_8_uxn_opcodes_h_l249_c3_d149_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l249_c3_d149_return_output := CONST_SL_8_uxn_opcodes_h_l249_c3_d149_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l269_c7_6c90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l267_c24_5482_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l249_c3_d149_return_output;
     VAR_printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l235_c1_e7e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l269_c7_6c90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l269_c7_6c90_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l264_c7_8e4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- printf_uxn_opcodes_h_l236_c3_6a1e[uxn_opcodes_h_l236_c3_6a1e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l236_c3_6a1e_uxn_opcodes_h_l236_c3_6a1e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_pc_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_pc_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l264_c7_8e4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l262_c24_d085] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l262_c24_d085_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l256_c3_de61_return_output);

     -- result_stack_value_MUX[uxn_opcodes_h_l264_c7_8e4d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output := result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l262_c24_d085_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l264_c7_8e4d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_return_output := tmp16_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_pc_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_cbc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l255_c7_cbc3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_return_output := tmp16_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l252_c7_3692] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_cond;
     result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_return_output := result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l252_c7_3692_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l247_c7_987e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l247_c7_987e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l243_c7_64ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l243_c7_64ac_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l235_c2_e1aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l274_l230_DUPLICATE_fa55 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l274_l230_DUPLICATE_fa55_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cb37(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l235_c2_e1aa_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l274_l230_DUPLICATE_fa55_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l274_l230_DUPLICATE_fa55_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
