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
entity jci_0CLK_9ff5fd8d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_9ff5fd8d;
architecture arch of jci_0CLK_9ff5fd8d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l68_c6_a4f9]
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_ff29]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l68_c2_caac]
signal tmp16_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l68_c2_caac]
signal t8_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l68_c2_caac]
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_caac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_caac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_caac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_caac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_caac]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l69_c3_9c8b[uxn_opcodes_h_l69_c3_9c8b]
signal printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l73_c11_4094]
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l73_c7_2423]
signal tmp16_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l73_c7_2423]
signal t8_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l73_c7_2423]
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_2423]
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_2423]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_2423]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_2423]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_2423]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l76_c11_c376]
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l76_c7_0ab2]
signal tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l76_c7_0ab2]
signal t8_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_0ab2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_0ab2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_0ab2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l76_c7_0ab2]
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_0ab2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l82_c11_36bc]
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l82_c7_2ec3]
signal tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_2ec3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_2ec3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l82_c7_2ec3]
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_2ec3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_9854]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_17dd]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_17dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l86_c7_17dd]
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_17dd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l88_c3_442b]
signal CONST_SL_8_uxn_opcodes_h_l88_c3_442b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l88_c3_442b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l89_c22_8791]
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l91_c11_117d]
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l91_c7_a5c3]
signal tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_a5c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l91_c7_a5c3]
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_a5c3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_8388]
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_1b23]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_7d43]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_7d43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_7d43]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_7d43]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_bf39]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c22_67df]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_a042]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_025b]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_527b]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c22_21e9]
signal MUX_uxn_opcodes_h_l97_c22_21e9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_21e9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_21e9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_21e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_84cb]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_477d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_477d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_43dc( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9
BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_left,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_right,
BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_return_output);

-- tmp16_MUX_uxn_opcodes_h_l68_c2_caac
tmp16_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l68_c2_caac_cond,
tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
tmp16_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- t8_MUX_uxn_opcodes_h_l68_c2_caac
t8_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l68_c2_caac_cond,
t8_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
t8_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
t8_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac
result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_cond,
result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

-- printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b
printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b : entity work.printf_uxn_opcodes_h_l69_c3_9c8b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_left,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_right,
BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output);

-- tmp16_MUX_uxn_opcodes_h_l73_c7_2423
tmp16_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l73_c7_2423_cond,
tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
tmp16_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- t8_MUX_uxn_opcodes_h_l73_c7_2423
t8_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l73_c7_2423_cond,
t8_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
t8_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
t8_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423
result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_cond,
result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376
BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_left,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_right,
BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output);

-- tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2
tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_cond,
tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue,
tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse,
tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output);

-- t8_MUX_uxn_opcodes_h_l76_c7_0ab2
t8_MUX_uxn_opcodes_h_l76_c7_0ab2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l76_c7_0ab2_cond,
t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue,
t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse,
t8_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2
result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_cond,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc
BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_left,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_right,
BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3
tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_cond,
tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue,
tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse,
tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3
result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_cond,
result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854
BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_17dd
tmp16_MUX_uxn_opcodes_h_l86_c7_17dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd
result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_cond,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l88_c3_442b
CONST_SL_8_uxn_opcodes_h_l88_c3_442b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l88_c3_442b_x,
CONST_SL_8_uxn_opcodes_h_l88_c3_442b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_left,
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_right,
BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d
BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_left,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_right,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3
tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_cond,
tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3
result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_cond,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_left,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_right,
BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_7d43
tmp16_MUX_uxn_opcodes_h_l94_c7_7d43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43
result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39
BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df
BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_return_output);

-- MUX_uxn_opcodes_h_l97_c22_21e9
MUX_uxn_opcodes_h_l97_c22_21e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c22_21e9_cond,
MUX_uxn_opcodes_h_l97_c22_21e9_iftrue,
MUX_uxn_opcodes_h_l97_c22_21e9_iffalse,
MUX_uxn_opcodes_h_l97_c22_21e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb
BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_return_output,
 tmp16_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 t8_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output,
 tmp16_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 t8_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output,
 tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output,
 t8_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_return_output,
 CONST_SL_8_uxn_opcodes_h_l88_c3_442b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output,
 tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_return_output,
 MUX_uxn_opcodes_h_l97_c22_21e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_be06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_c940 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_2423_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_22fa : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l89_c3_ec23 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_442b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_442b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l92_c3_e8cc : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_21e9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_21e9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_21e9_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_21e9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_b1c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_ea73_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_98bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_cdd1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l104_l63_DUPLICATE_04ae_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_c940 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_c940;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_22fa := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l79_c3_22fa;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_be06 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l70_c3_be06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l97_c22_67df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l73_c11_4094] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_left;
     BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output := BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l68_c6_a4f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_84cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l92_c22_8388] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_left;
     BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_return_output := BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_98bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_98bc_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l91_c11_117d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_left;
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output := BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_1b23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l89_c22_8791] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_left;
     BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_return_output := BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_9854] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_ea73 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_ea73_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l76_c11_c376] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_left;
     BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output := BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l82_c11_36bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_cdd1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_cdd1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_b1c0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_b1c0_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_a042] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_2423_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l68_c6_a4f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l73_c11_4094_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l76_c11_c376_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l82_c11_36bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_9854_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_117d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_1b23_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c22_21e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_67df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_84cb_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l89_c3_ec23 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l89_c22_8791_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l92_c3_e8cc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l92_c22_8388_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c22_21e9_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_a042_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_cdd1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_442b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l87_DUPLICATE_cdd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_ea73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_ea73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l76_l68_l73_DUPLICATE_ea73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_b1c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_b1c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l68_l94_l73_DUPLICATE_b1c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l94_DUPLICATE_422f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l91_l86_l82_l76_l73_l99_l68_DUPLICATE_faa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_98bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_98bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l68_l82_l73_DUPLICATE_98bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l73_c7_2423_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue := VAR_result_u16_value_uxn_opcodes_h_l89_c3_ec23;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l92_c3_e8cc;
     -- t8_MUX[uxn_opcodes_h_l76_c7_0ab2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l76_c7_0ab2_cond <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_cond;
     t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue;
     t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output := t8_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_bf39] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_477d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l88_c3_442b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l88_c3_442b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_442b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_442b_return_output := CONST_SL_8_uxn_opcodes_h_l88_c3_442b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l68_c1_ff29] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l82_c7_2ec3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_477d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l76_c7_0ab2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_bf39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_442b_return_output;
     VAR_printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l68_c1_ff29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_477d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_477d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_t8_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l94_c7_7d43] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;

     -- printf_uxn_opcodes_h_l69_c3_9c8b[uxn_opcodes_h_l69_c3_9c8b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l69_c3_9c8b_uxn_opcodes_h_l69_c3_9c8b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     t8_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     t8_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_return_output := t8_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l76_c7_0ab2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_025b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_7d43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_7d43] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_025b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_t8_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l91_c7_a5c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_cond;
     tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output := tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_527b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_a5c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;

     -- t8_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     t8_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     t8_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_return_output := t8_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_a5c3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c22_21e9_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_527b_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l68_c2_caac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_17dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_17dd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- MUX[uxn_opcodes_h_l97_c22_21e9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c22_21e9_cond <= VAR_MUX_uxn_opcodes_h_l97_c22_21e9_cond;
     MUX_uxn_opcodes_h_l97_c22_21e9_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c22_21e9_iftrue;
     MUX_uxn_opcodes_h_l97_c22_21e9_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c22_21e9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c22_21e9_return_output := MUX_uxn_opcodes_h_l97_c22_21e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l86_c7_17dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue := VAR_MUX_uxn_opcodes_h_l97_c22_21e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l82_c7_2ec3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l82_c7_2ec3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l82_c7_2ec3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_cond;
     tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output := tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_7d43] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_7d43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l76_c7_0ab2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l91_c7_a5c3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output := result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l76_c7_0ab2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l76_c7_0ab2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_cond;
     tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output := tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_a5c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l86_c7_17dd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_return_output := result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_return_output := tmp16_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_17dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l82_c7_2ec3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output := result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_return_output := tmp16_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l82_c7_2ec3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l68_c2_caac_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l76_c7_0ab2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output := result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l76_c7_0ab2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l73_c7_2423] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_cond;
     result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_return_output := result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_return_output;

     -- Submodule level 11
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l73_c7_2423_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l68_c2_caac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_return_output := result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l104_l63_DUPLICATE_04ae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l104_l63_DUPLICATE_04ae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_43dc(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l68_c2_caac_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l68_c2_caac_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l104_l63_DUPLICATE_04ae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l104_l63_DUPLICATE_04ae_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
