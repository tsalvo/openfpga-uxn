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
-- Submodules: 104
entity sft2_0CLK_d29b8e2d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_d29b8e2d;
architecture arch of sft2_0CLK_d29b8e2d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2615_c6_554c]
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2615_c1_c85d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal t8_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal n16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2615_c2_59ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2616_c3_056a[uxn_opcodes_h_l2616_c3_056a]
signal printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2621_c11_6954]
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2621_c7_8fa4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2624_c11_8c5e]
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal t8_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal n16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2624_c7_ba32]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2628_c11_19b6]
signal BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2628_c7_fd6d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2631_c11_3447]
signal BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal n16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2631_c7_dc34]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2633_c3_7387]
signal CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2636_c11_6b15]
signal BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal n16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2636_c7_59fe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2639_c11_09bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2639_c7_485b]
signal n16_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2639_c7_485b]
signal tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2639_c7_485b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2639_c7_485b]
signal result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2639_c7_485b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2639_c7_485b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2639_c7_485b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2639_c7_485b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2639_c7_485b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2640_c3_3e59]
signal BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2643_c32_5733]
signal BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2643_c32_fc84]
signal BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2643_c32_f63c]
signal MUX_uxn_opcodes_h_l2643_c32_f63c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2643_c32_f63c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2643_c32_f63c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2643_c32_f63c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_beb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2645_c7_4292]
signal tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_4292]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2645_c7_4292]
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2645_c7_4292]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_4292]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_4292]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2646_c20_2a0b]
signal BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2646_c12_bd44]
signal BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2646_c36_2831]
signal CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2646_c12_d5f1]
signal BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2652_c11_4ef7]
signal BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2652_c7_c86b]
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2652_c7_c86b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2652_c7_c86b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2652_c7_c86b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2654_c34_6c83]
signal CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_b4fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_27ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c7_27ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c
BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_left,
BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_right,
BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_return_output);

-- t8_MUX_uxn_opcodes_h_l2615_c2_59ab
t8_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
t8_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- n16_MUX_uxn_opcodes_h_l2615_c2_59ab
n16_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
n16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab
tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab
result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab
result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

-- printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a
printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a : entity work.printf_uxn_opcodes_h_l2616_c3_056a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_left,
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_right,
BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output);

-- t8_MUX_uxn_opcodes_h_l2621_c7_8fa4
t8_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- n16_MUX_uxn_opcodes_h_l2621_c7_8fa4
n16_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4
tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4
result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_left,
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_right,
BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output);

-- t8_MUX_uxn_opcodes_h_l2624_c7_ba32
t8_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
t8_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- n16_MUX_uxn_opcodes_h_l2624_c7_ba32
n16_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
n16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32
tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32
result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_left,
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_right,
BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output);

-- n16_MUX_uxn_opcodes_h_l2628_c7_fd6d
n16_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d
tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d
result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d
result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d
result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447
BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_left,
BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_right,
BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output);

-- n16_MUX_uxn_opcodes_h_l2631_c7_dc34
n16_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
n16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34
tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34
result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34
result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34
result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34
result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34
result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34
result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2633_c3_7387
CONST_SL_8_uxn_opcodes_h_l2633_c3_7387 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_x,
CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_left,
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_right,
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output);

-- n16_MUX_uxn_opcodes_h_l2636_c7_59fe
n16_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
n16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe
tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe
result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe
result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output);

-- n16_MUX_uxn_opcodes_h_l2639_c7_485b
n16_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
n16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
n16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
n16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2639_c7_485b
tmp16_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b
result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b
result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b
result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b
result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59
BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_left,
BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_right,
BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733
BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_left,
BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_right,
BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84
BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_left,
BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_right,
BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_return_output);

-- MUX_uxn_opcodes_h_l2643_c32_f63c
MUX_uxn_opcodes_h_l2643_c32_f63c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2643_c32_f63c_cond,
MUX_uxn_opcodes_h_l2643_c32_f63c_iftrue,
MUX_uxn_opcodes_h_l2643_c32_f63c_iffalse,
MUX_uxn_opcodes_h_l2643_c32_f63c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2645_c7_4292
tmp16_MUX_uxn_opcodes_h_l2645_c7_4292 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_cond,
tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue,
tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse,
tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_cond,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b
BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_left,
BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_right,
BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44
BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_left,
BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_right,
BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2646_c36_2831
CONST_SR_4_uxn_opcodes_h_l2646_c36_2831 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_x,
CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1
BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_left,
BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_right,
BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_left,
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_right,
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83
CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_x,
CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_return_output,
 t8_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 n16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output,
 t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output,
 t8_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 n16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output,
 n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output,
 n16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output,
 CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output,
 n16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output,
 n16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_return_output,
 MUX_uxn_opcodes_h_l2643_c32_f63c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_return_output,
 CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output,
 CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_b09d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_bcac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2626_c3_84b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2629_c3_398c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2634_c3_6eeb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_4bd5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2649_c3_3822 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2650_c24_c6e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2653_c3_8a6d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2654_c24_6e9a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2632_l2640_DUPLICATE_278d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2652_l2639_DUPLICATE_3dd8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2661_l2610_DUPLICATE_c357_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_b09d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_b09d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_bcac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2622_c3_bcac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2626_c3_84b7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2626_c3_84b7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2653_c3_8a6d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2653_c3_8a6d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2634_c3_6eeb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2634_c3_6eeb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_right := to_unsigned(15, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2629_c3_398c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2629_c3_398c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_4bd5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_4bd5;
     VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2649_c3_3822 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2649_c3_3822;
     VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_b4fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2631_c11_3447] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_left;
     BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output := BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2652_c11_4ef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2621_c11_6954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_left;
     BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output := BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2652_l2639_DUPLICATE_3dd8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2652_l2639_DUPLICATE_3dd8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2646_c20_2a0b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_left;
     BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_return_output := BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2628_c11_19b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2645_c11_beb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2615_c6_554c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2639_c11_09bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l2654_c34_6c83] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_return_output := CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2632_l2640_DUPLICATE_278d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2632_l2640_DUPLICATE_278d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2636_c11_6b15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_left;
     BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output := BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2643_c32_5733] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_left;
     BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_return_output := BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output := result.is_sp_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2646_c36_2831] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_return_output := CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2624_c11_8c5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2643_c32_5733_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2646_c20_2a0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c6_554c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2621_c11_6954_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2624_c11_8c5e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2628_c11_19b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2631_c11_3447_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_6b15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_09bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2645_c11_beb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_4ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_b4fe_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2632_l2640_DUPLICATE_278d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2632_l2640_DUPLICATE_278d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2615_l2639_l2636_DUPLICATE_d864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2645_l2639_l2636_DUPLICATE_8313_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2645_l2615_l2636_DUPLICATE_9988_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2621_l2639_l2636_DUPLICATE_aab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2631_l2628_l2656_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_0873_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2652_l2639_DUPLICATE_3dd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2652_l2639_DUPLICATE_3dd8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2631_l2628_l2624_l2652_l2621_l2615_l2639_l2636_DUPLICATE_de19_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_right := VAR_CONST_SR_4_uxn_opcodes_h_l2646_c36_2831_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2652_c7_c86b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2654_c24_6e9a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2654_c24_6e9a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2654_c34_6c83_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c7_27ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2640_c3_3e59] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_left;
     BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_return_output := BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2645_c7_4292] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;

     -- t8_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := t8_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2615_c1_c85d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2633_c3_7387] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_return_output := CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2646_c12_bd44] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_left;
     BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_return_output := BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_27ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2643_c32_fc84] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_left;
     BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_return_output := BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2643_c32_fc84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2640_c3_3e59_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2646_c12_bd44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2654_c24_6e9a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2633_c3_7387_return_output;
     VAR_printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2615_c1_c85d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_27ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2652_c7_c86b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2645_c7_4292] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2646_c12_d5f1] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_left;
     BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output := BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2652_c7_c86b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;

     -- printf_uxn_opcodes_h_l2616_c3_056a[uxn_opcodes_h_l2616_c3_056a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2616_c3_056a_uxn_opcodes_h_l2616_c3_056a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2643_c32_f63c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2643_c32_f63c_cond <= VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_cond;
     MUX_uxn_opcodes_h_l2643_c32_f63c_iftrue <= VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_iftrue;
     MUX_uxn_opcodes_h_l2643_c32_f63c_iffalse <= VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_return_output := MUX_uxn_opcodes_h_l2643_c32_f63c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2652_c7_c86b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     n16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     n16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := n16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue := VAR_MUX_uxn_opcodes_h_l2643_c32_f63c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_c86b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2645_c7_4292] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2645_c7_4292] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;

     -- n16_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := n16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2645_c7_4292] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_cond;
     tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_return_output := tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2650_c24_c6e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2650_c24_c6e7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2646_c12_d5f1_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := t8_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2650_c24_c6e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := n16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2645_c7_4292] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_return_output := result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2645_c7_4292_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2639_c7_485b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2639_c7_485b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2636_c7_59fe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output := result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- n16_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := n16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_59fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2631_c7_dc34] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output := result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2631_c7_dc34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2628_c7_fd6d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := n16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2628_c7_fd6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2624_c7_ba32] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output := result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2624_c7_ba32_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2621_c7_8fa4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2621_c7_8fa4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2615_c2_59ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2661_l2610_DUPLICATE_c357 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2661_l2610_DUPLICATE_c357_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2615_c2_59ab_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2661_l2610_DUPLICATE_c357_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2661_l2610_DUPLICATE_c357_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
