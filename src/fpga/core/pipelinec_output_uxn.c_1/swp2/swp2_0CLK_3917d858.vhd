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
-- Submodules: 117
entity swp2_0CLK_3917d858 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_3917d858;
architecture arch of swp2_0CLK_3917d858 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2824_c6_9944]
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2824_c2_a5dd]
signal n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_40bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2829_c7_f4c4]
signal n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_a8a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2832_c7_6ce6]
signal n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_af1d]
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal t16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2837_c7_16cd]
signal n16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_e843]
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal t16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2840_c7_c14d]
signal n16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2841_c3_a58b]
signal BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_e6a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2844_c7_724f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2844_c7_724f]
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2844_c7_724f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2844_c7_724f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2844_c7_724f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2844_c7_724f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2844_c7_724f]
signal n16_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_fe04]
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2847_c7_c715]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2847_c7_c715]
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2847_c7_c715]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2847_c7_c715]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2847_c7_c715]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2847_c7_c715]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2847_c7_c715]
signal n16_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_03ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2852_c7_9562]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2852_c7_9562]
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2852_c7_9562]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2852_c7_9562]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2852_c7_9562]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2852_c7_9562]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2852_c7_9562]
signal n16_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_fee0]
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2855_c7_0d31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2855_c7_0d31]
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2855_c7_0d31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2855_c7_0d31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2855_c7_0d31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2855_c7_0d31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2855_c7_0d31]
signal n16_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2856_c3_b282]
signal BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2858_c32_da0b]
signal BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2858_c32_18e8]
signal BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2858_c32_8f7d]
signal MUX_uxn_opcodes_h_l2858_c32_8f7d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2858_c32_8f7d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2858_c32_8f7d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2858_c32_8f7d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_cee5]
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2860_c7_a4a1]
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2860_c7_a4a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2860_c7_a4a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2860_c7_a4a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2860_c7_a4a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_eb88]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_62dc]
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_62dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_62dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_62dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_62dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2868_c34_bf54]
signal CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_1084]
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2870_c7_e722]
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2870_c7_e722]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2870_c7_e722]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2870_c7_e722]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2870_c7_e722]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_548b]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2875_c7_65bf]
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2875_c7_65bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2875_c7_65bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2875_c7_65bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2877_c34_6692]
signal CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_022e]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_956d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_956d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_left,
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_right,
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output);

-- t16_MUX_uxn_opcodes_h_l2824_c2_a5dd
t16_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2824_c2_a5dd
n16_MUX_uxn_opcodes_h_l2824_c2_a5dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond,
n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue,
n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse,
n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output);

-- t16_MUX_uxn_opcodes_h_l2829_c7_f4c4
t16_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- n16_MUX_uxn_opcodes_h_l2829_c7_f4c4
n16_MUX_uxn_opcodes_h_l2829_c7_f4c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond,
n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue,
n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse,
n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output);

-- t16_MUX_uxn_opcodes_h_l2832_c7_6ce6
t16_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- n16_MUX_uxn_opcodes_h_l2832_c7_6ce6
n16_MUX_uxn_opcodes_h_l2832_c7_6ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond,
n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue,
n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse,
n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_left,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_right,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output);

-- t16_MUX_uxn_opcodes_h_l2837_c7_16cd
t16_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
t16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- n16_MUX_uxn_opcodes_h_l2837_c7_16cd
n16_MUX_uxn_opcodes_h_l2837_c7_16cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond,
n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue,
n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse,
n16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_left,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_right,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output);

-- t16_MUX_uxn_opcodes_h_l2840_c7_c14d
t16_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
t16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- n16_MUX_uxn_opcodes_h_l2840_c7_c14d
n16_MUX_uxn_opcodes_h_l2840_c7_c14d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond,
n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue,
n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse,
n16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b
BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_left,
BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_right,
BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_return_output);

-- n16_MUX_uxn_opcodes_h_l2844_c7_724f
n16_MUX_uxn_opcodes_h_l2844_c7_724f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2844_c7_724f_cond,
n16_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue,
n16_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse,
n16_MUX_uxn_opcodes_h_l2844_c7_724f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_left,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_right,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_cond,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_return_output);

-- n16_MUX_uxn_opcodes_h_l2847_c7_c715
n16_MUX_uxn_opcodes_h_l2847_c7_c715 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2847_c7_c715_cond,
n16_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue,
n16_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse,
n16_MUX_uxn_opcodes_h_l2847_c7_c715_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_cond,
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_return_output);

-- n16_MUX_uxn_opcodes_h_l2852_c7_9562
n16_MUX_uxn_opcodes_h_l2852_c7_9562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2852_c7_9562_cond,
n16_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue,
n16_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse,
n16_MUX_uxn_opcodes_h_l2852_c7_9562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_left,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_right,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_cond,
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output);

-- n16_MUX_uxn_opcodes_h_l2855_c7_0d31
n16_MUX_uxn_opcodes_h_l2855_c7_0d31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2855_c7_0d31_cond,
n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue,
n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse,
n16_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282
BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_left,
BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_right,
BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b
BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_left,
BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_right,
BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8
BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_left,
BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_right,
BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_return_output);

-- MUX_uxn_opcodes_h_l2858_c32_8f7d
MUX_uxn_opcodes_h_l2858_c32_8f7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2858_c32_8f7d_cond,
MUX_uxn_opcodes_h_l2858_c32_8f7d_iftrue,
MUX_uxn_opcodes_h_l2858_c32_8f7d_iffalse,
MUX_uxn_opcodes_h_l2858_c32_8f7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_left,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_right,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54
CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_x,
CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_left,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_right,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_cond,
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2877_c34_6692
CONST_SR_8_uxn_opcodes_h_l2877_c34_6692 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_x,
CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74
CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output,
 t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output,
 t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output,
 t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output,
 t16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 n16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output,
 t16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 n16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_return_output,
 n16_MUX_uxn_opcodes_h_l2844_c7_724f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_return_output,
 n16_MUX_uxn_opcodes_h_l2847_c7_c715_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_return_output,
 n16_MUX_uxn_opcodes_h_l2852_c7_9562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output,
 n16_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_return_output,
 MUX_uxn_opcodes_h_l2858_c32_8f7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output,
 CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output,
 CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_1df6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_98bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_8a0b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_f938 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_2c08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_ac8a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_0f6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2853_c3_e664 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_76a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_df4f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2867_c3_b247 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2868_c24_f433_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_c5fe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_6d0e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_f87d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2877_c24_b8dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2841_l2848_l2833_l2856_DUPLICATE_9aef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_77dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2820_l2884_DUPLICATE_af8c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_0f6e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_0f6e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2853_c3_e664 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2853_c3_e664;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_2c08 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_2c08;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_98bc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_98bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_8a0b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_8a0b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_f938 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_f938;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_ac8a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_ac8a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_76a4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_76a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_1df6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_1df6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_c5fe := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_c5fe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_f87d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_f87d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2867_c3_b247 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2867_c3_b247;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_right := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2864_c24_df4f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_df4f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_40bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2858_c32_da0b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_left;
     BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_return_output := BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_cee5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_e843] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_left;
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output := BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_af1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_1084] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_left;
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output := BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_fee0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_e6a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_77dd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_77dd_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2877_c34_6692] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_return_output := CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_fe04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_a8a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_548b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2873_c24_6d0e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_6d0e_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8[uxn_opcodes_h_l2868_c34_bf54] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_return_output := CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2841_l2848_l2833_l2856_DUPLICATE_9aef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2841_l2848_l2833_l2856_DUPLICATE_9aef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_eb88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_03ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2824_c6_9944] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_left;
     BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output := BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_022e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_da0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_9944_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_40bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_a8a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_af1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_e843_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_e6a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_03ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_fee0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_cee5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_eb88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_1084_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_548b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_022e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2841_l2848_l2833_l2856_DUPLICATE_9aef_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2841_l2848_l2833_l2856_DUPLICATE_9aef_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2841_l2848_l2833_l2856_DUPLICATE_9aef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_df4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_6d0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2840_l2837_l2832_l2855_DUPLICATE_ec44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2860_l2832_l2855_DUPLICATE_bcf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2844_l2870_l2840_l2866_l2837_l2832_DUPLICATE_db30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_l2840_l2866_l2837_l2832_l2855_DUPLICATE_e648_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_77dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_77dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2852_l2824_l2847_l2875_l2844_l2840_l2837_l2832_l2855_DUPLICATE_3506_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2841_c3_a58b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_left;
     BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_return_output := BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2870_c7_e722] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2877_c24_b8dd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2877_c24_b8dd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_6692_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2875_c7_65bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2858_c32_18e8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_left;
     BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_return_output := BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_956d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2856_c3_b282] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_left;
     BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_return_output := BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2868_c24_f433] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2868_c24_f433_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_bf54_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_956d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_18e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_a58b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_b282_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2868_c24_f433_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2877_c24_b8dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_cb74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_956d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_956d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2875_c7_65bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_62dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2875_c7_65bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;

     -- MUX[uxn_opcodes_h_l2858_c32_8f7d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2858_c32_8f7d_cond <= VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_cond;
     MUX_uxn_opcodes_h_l2858_c32_8f7d_iftrue <= VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_iftrue;
     MUX_uxn_opcodes_h_l2858_c32_8f7d_iffalse <= VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_return_output := MUX_uxn_opcodes_h_l2858_c32_8f7d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := t16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2875_c7_65bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2870_c7_e722] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;

     -- n16_MUX[uxn_opcodes_h_l2855_c7_0d31] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2855_c7_0d31_cond <= VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_cond;
     n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue;
     n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output := n16_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue := VAR_MUX_uxn_opcodes_h_l2858_c32_8f7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_65bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2870_c7_e722] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_return_output := result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;

     -- t16_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := t16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2852_c7_9562] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2852_c7_9562_cond <= VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_cond;
     n16_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue;
     n16_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_return_output := n16_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2855_c7_0d31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_62dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2870_c7_e722] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2870_c7_e722] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2860_c7_a4a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_e722_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2852_c7_9562] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;

     -- t16_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2847_c7_c715] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2847_c7_c715_cond <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_cond;
     n16_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue;
     n16_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_return_output := n16_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_62dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_62dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2855_c7_0d31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_62dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2860_c7_a4a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_62dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2855_c7_0d31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2860_c7_a4a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2852_c7_9562] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2860_c7_a4a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2860_c7_a4a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2844_c7_724f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2844_c7_724f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_cond;
     n16_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue;
     n16_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_return_output := n16_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2847_c7_c715] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_a4a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2855_c7_0d31] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output := result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2844_c7_724f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := n16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2855_c7_0d31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2855_c7_0d31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2847_c7_c715] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;

     -- t16_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2852_c7_9562] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_0d31_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2844_c7_724f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2847_c7_c715] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2852_c7_9562] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2852_c7_9562] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := n16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2852_c7_9562] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_return_output := result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_9562_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2844_c7_724f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2847_c7_c715] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2847_c7_c715] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_return_output := result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2847_c7_c715] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_c715_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2844_c7_724f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2844_c7_724f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2844_c7_724f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_724f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_c14d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_c14d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_16cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_16cd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_6ce6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_6ce6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2829_c7_f4c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_f4c4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2824_c2_a5dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2820_l2884_DUPLICATE_af8c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2820_l2884_DUPLICATE_af8c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_a5dd_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2820_l2884_DUPLICATE_af8c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2820_l2884_DUPLICATE_af8c_return_output;
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
