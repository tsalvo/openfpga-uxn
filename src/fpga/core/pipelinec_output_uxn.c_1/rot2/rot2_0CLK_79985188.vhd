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
-- Submodules: 185
entity rot2_0CLK_79985188 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_79985188;
architecture arch of rot2_0CLK_79985188 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2620_c6_d00b]
signal BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2620_c1_1071]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2620_c2_fc8a]
signal t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2621_c3_b635[uxn_opcodes_h_l2621_c3_b635]
signal printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_7698]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal n16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal l16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2626_c7_5e30]
signal t16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2629_c11_17f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2629_c7_6fe5]
signal t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2634_c11_821e]
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal n16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal l16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2634_c7_dc00]
signal t16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2637_c11_1e92]
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal n16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal l16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2637_c7_cb62]
signal t16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2638_c3_907b]
signal BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_9df0]
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2641_c7_6f6f]
signal l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2644_c11_4213]
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal n16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2644_c7_65fd]
signal l16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_50e3]
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2649_c7_c553]
signal n16_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2649_c7_c553]
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_c553]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c7_c553]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2649_c7_c553]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c7_c553]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c7_c553]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_c553]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2649_c7_c553]
signal l16_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2652_c11_c88c]
signal BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2652_c7_0465]
signal n16_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2652_c7_0465]
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2652_c7_0465]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2652_c7_0465]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2652_c7_0465]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2652_c7_0465]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2652_c7_0465]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2652_c7_0465]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2652_c7_0465]
signal l16_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2653_c3_a8e6]
signal BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_0895]
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2656_c7_e1c9]
signal l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2659_c11_4399]
signal BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2659_c7_0e13]
signal l16_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_c5d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2664_c7_91c9]
signal l16_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2667_c11_5f97]
signal BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2667_c7_b79a]
signal l16_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2668_c3_3702]
signal BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2671_c32_1861]
signal BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2671_c32_0a8a]
signal BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2671_c32_8806]
signal MUX_uxn_opcodes_h_l2671_c32_8806_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2671_c32_8806_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2671_c32_8806_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2671_c32_8806_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_07d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2673_c7_b746]
signal result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_b746]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_b746]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_b746]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_b746]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_ed0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2679_c7_37b2]
signal result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2679_c7_37b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2679_c7_37b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2679_c7_37b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2681_c34_53d7]
signal CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_da49]
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2683_c7_3c49]
signal result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2683_c7_3c49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2683_c7_3c49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2683_c7_3c49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2687_c11_426a]
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2687_c7_fa5e]
signal result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2687_c7_fa5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2687_c7_fa5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2687_c7_fa5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2689_c34_0085]
signal CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2691_c11_0178]
signal BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2691_c7_e42c]
signal result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2691_c7_e42c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2691_c7_e42c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2691_c7_e42c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2695_c11_a45f]
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2695_c7_032f]
signal result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2695_c7_032f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2695_c7_032f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2695_c7_032f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2697_c34_7a62]
signal CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_a6ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_da8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_da8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b
BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_left,
BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_right,
BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_return_output);

-- n16_MUX_uxn_opcodes_h_l2620_c2_fc8a
n16_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a
result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- l16_MUX_uxn_opcodes_h_l2620_c2_fc8a
l16_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- t16_MUX_uxn_opcodes_h_l2620_c2_fc8a
t16_MUX_uxn_opcodes_h_l2620_c2_fc8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond,
t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue,
t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse,
t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

-- printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635
printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635 : entity work.printf_uxn_opcodes_h_l2621_c3_b635_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output);

-- n16_MUX_uxn_opcodes_h_l2626_c7_5e30
n16_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
n16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30
result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- l16_MUX_uxn_opcodes_h_l2626_c7_5e30
l16_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
l16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- t16_MUX_uxn_opcodes_h_l2626_c7_5e30
t16_MUX_uxn_opcodes_h_l2626_c7_5e30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond,
t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue,
t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse,
t16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2
BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output);

-- n16_MUX_uxn_opcodes_h_l2629_c7_6fe5
n16_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5
result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5
result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5
result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5
result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5
result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- l16_MUX_uxn_opcodes_h_l2629_c7_6fe5
l16_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- t16_MUX_uxn_opcodes_h_l2629_c7_6fe5
t16_MUX_uxn_opcodes_h_l2629_c7_6fe5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond,
t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue,
t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse,
t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_left,
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_right,
BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output);

-- n16_MUX_uxn_opcodes_h_l2634_c7_dc00
n16_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
n16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00
result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00
result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00
result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- l16_MUX_uxn_opcodes_h_l2634_c7_dc00
l16_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
l16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- t16_MUX_uxn_opcodes_h_l2634_c7_dc00
t16_MUX_uxn_opcodes_h_l2634_c7_dc00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond,
t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue,
t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse,
t16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92
BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_left,
BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_right,
BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output);

-- n16_MUX_uxn_opcodes_h_l2637_c7_cb62
n16_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
n16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62
result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62
result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- l16_MUX_uxn_opcodes_h_l2637_c7_cb62
l16_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
l16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- t16_MUX_uxn_opcodes_h_l2637_c7_cb62
t16_MUX_uxn_opcodes_h_l2637_c7_cb62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond,
t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue,
t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse,
t16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b
BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_left,
BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_right,
BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_left,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_right,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output);

-- n16_MUX_uxn_opcodes_h_l2641_c7_6f6f
n16_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- l16_MUX_uxn_opcodes_h_l2641_c7_6f6f
l16_MUX_uxn_opcodes_h_l2641_c7_6f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond,
l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue,
l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse,
l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_left,
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_right,
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output);

-- n16_MUX_uxn_opcodes_h_l2644_c7_65fd
n16_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
n16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd
result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd
result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd
result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- l16_MUX_uxn_opcodes_h_l2644_c7_65fd
l16_MUX_uxn_opcodes_h_l2644_c7_65fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond,
l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue,
l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse,
l16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_left,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_right,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output);

-- n16_MUX_uxn_opcodes_h_l2649_c7_c553
n16_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
n16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
n16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
n16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553
result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- l16_MUX_uxn_opcodes_h_l2649_c7_c553
l16_MUX_uxn_opcodes_h_l2649_c7_c553 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2649_c7_c553_cond,
l16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue,
l16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse,
l16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_left,
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_right,
BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output);

-- n16_MUX_uxn_opcodes_h_l2652_c7_0465
n16_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
n16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
n16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
n16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465
result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465
result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465
result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- l16_MUX_uxn_opcodes_h_l2652_c7_0465
l16_MUX_uxn_opcodes_h_l2652_c7_0465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2652_c7_0465_cond,
l16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue,
l16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse,
l16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6
BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_left,
BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_right,
BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_left,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_right,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9
result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- l16_MUX_uxn_opcodes_h_l2656_c7_e1c9
l16_MUX_uxn_opcodes_h_l2656_c7_e1c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond,
l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue,
l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse,
l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399
BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_left,
BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_right,
BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13
result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13
result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13
result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13
result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13
result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13
result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- l16_MUX_uxn_opcodes_h_l2659_c7_0e13
l16_MUX_uxn_opcodes_h_l2659_c7_0e13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2659_c7_0e13_cond,
l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue,
l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse,
l16_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- l16_MUX_uxn_opcodes_h_l2664_c7_91c9
l16_MUX_uxn_opcodes_h_l2664_c7_91c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2664_c7_91c9_cond,
l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue,
l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse,
l16_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97
BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_left,
BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_right,
BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a
result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a
result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a
result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a
result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a
result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- l16_MUX_uxn_opcodes_h_l2667_c7_b79a
l16_MUX_uxn_opcodes_h_l2667_c7_b79a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2667_c7_b79a_cond,
l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue,
l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse,
l16_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702
BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_left,
BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_right,
BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861
BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_left,
BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_right,
BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a
BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_left,
BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_right,
BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_return_output);

-- MUX_uxn_opcodes_h_l2671_c32_8806
MUX_uxn_opcodes_h_l2671_c32_8806 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2671_c32_8806_cond,
MUX_uxn_opcodes_h_l2671_c32_8806_iftrue,
MUX_uxn_opcodes_h_l2671_c32_8806_iffalse,
MUX_uxn_opcodes_h_l2671_c32_8806_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746
result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_cond,
result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2
result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7
CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_x,
CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_left,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_right,
BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49
result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_cond,
result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_left,
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_right,
BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e
result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2689_c34_0085
CONST_SR_8_uxn_opcodes_h_l2689_c34_0085 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_x,
CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_left,
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_right,
BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c
result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c
result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c
result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_left,
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_right,
BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f
result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f
result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62
CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_x,
CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18
CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_return_output,
 n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output,
 n16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 l16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 t16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output,
 n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output,
 n16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 l16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 t16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output,
 n16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 l16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 t16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output,
 n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output,
 n16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 l16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output,
 n16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 l16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output,
 n16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 l16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 l16_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 l16_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 l16_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_return_output,
 MUX_uxn_opcodes_h_l2671_c32_8806_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output,
 CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_ca05 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_9851 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2632_c3_79ca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2635_c3_8df3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_a194 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2642_c3_af33 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_2c60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_08a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_e96b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2657_c3_b2dd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_9dbb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_43ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2671_c32_8806_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2671_c32_8806_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2671_c32_8806_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2671_c32_8806_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_9696 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2677_c24_2e4e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2680_c3_5545 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2681_c24_3155_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_877f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2685_c24_5ffa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2688_c3_4f6c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2689_c24_c085_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2692_c3_c878 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2693_c24_9666_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_69f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2697_c24_9c5c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2660_l2668_l2638_l2630_l2653_l2645_DUPLICATE_2bfd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2695_l2667_DUPLICATE_e4ad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2704_l2616_DUPLICATE_eac2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_e96b := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_e96b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_9696 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_9696;
     VAR_MUX_uxn_opcodes_h_l2671_c32_8806_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_9851 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_9851;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_right := to_unsigned(12, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_right := to_unsigned(18, 5);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2692_c3_c878 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2692_c3_c878;
     VAR_MUX_uxn_opcodes_h_l2671_c32_8806_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2688_c3_4f6c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2688_c3_4f6c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2635_c3_8df3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2635_c3_8df3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_08a0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_08a0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2657_c3_b2dd := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2657_c3_b2dd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2680_c3_5545 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2680_c3_5545;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_a194 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_a194;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_2c60 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_2c60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_43ac := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_43ac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_69f2 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_69f2;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_9dbb := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_9dbb;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2642_c3_af33 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2642_c3_af33;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_right := to_unsigned(19, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_ca05 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_ca05;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2632_c3_79ca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2632_c3_79ca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_877f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_877f;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2667_c11_5f97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_left;
     BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output := BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2634_c11_821e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2697_c34_7a62] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_return_output := CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2687_c11_426a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2637_c11_1e92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2659_c11_4399] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_left;
     BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output := BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2620_c6_d00b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2695_l2667_DUPLICATE_e4ad LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2695_l2667_DUPLICATE_e4ad_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2693_c24_9666] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2693_c24_9666_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_50e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2673_c11_07d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_0895] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_left;
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output := BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2689_c34_0085] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_return_output := CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2671_c32_1861] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_left;
     BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_return_output := BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_7698] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_a6ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_c5d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2644_c11_4213] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_left;
     BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output := BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_ed0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_9df0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2695_c11_a45f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2685_c24_5ffa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2685_c24_5ffa_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2660_l2668_l2638_l2630_l2653_l2645_DUPLICATE_2bfd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2660_l2668_l2638_l2630_l2653_l2645_DUPLICATE_2bfd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2677_c24_2e4e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2677_c24_2e4e_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2652_c11_c88c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2683_c11_da49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2681_c34_53d7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_return_output := CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2691_c11_0178] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_left;
     BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output := BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2629_c11_17f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2671_c32_1861_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c6_d00b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_7698_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2629_c11_17f2_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2634_c11_821e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2637_c11_1e92_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_9df0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_4213_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_50e3_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2652_c11_c88c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_0895_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2659_c11_4399_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_c5d0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2667_c11_5f97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2673_c11_07d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_ed0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2683_c11_da49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2687_c11_426a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2691_c11_0178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2695_c11_a45f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_a6ea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2660_l2668_l2638_l2630_l2653_l2645_DUPLICATE_2bfd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2660_l2668_l2638_l2630_l2653_l2645_DUPLICATE_2bfd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2660_l2668_l2638_l2630_l2653_l2645_DUPLICATE_2bfd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2660_l2668_l2638_l2630_l2653_l2645_DUPLICATE_2bfd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2677_c24_2e4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2685_c24_5ffa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2693_c24_9666_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_c284_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2673_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_DUPLICATE_5053_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2673_l2620_l2644_DUPLICATE_881e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2644_l2667_DUPLICATE_ff0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2699_l2695_l2691_l2687_l2683_l2679_l2667_l2664_l2659_l2656_l2652_l2649_l2644_l2641_l2637_l2634_l2629_l2626_l2620_DUPLICATE_3afb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2695_l2667_DUPLICATE_e4ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2695_l2667_DUPLICATE_e4ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2695_l2641_l2664_l2637_l2659_l2634_l2656_l2629_l2652_l2626_l2649_l2620_l2644_l2667_DUPLICATE_4941_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2638_c3_907b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_left;
     BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_return_output := BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2671_c32_0a8a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_left;
     BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_return_output := BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2673_c7_b746] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2697_c24_9c5c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2697_c24_9c5c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2697_c34_7a62_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2620_c1_1071] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2695_c7_032f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2668_c3_3702] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_left;
     BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_return_output := BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2681_c24_3155] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2681_c24_3155_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2681_c34_53d7_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2689_c24_c085] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2689_c24_c085_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2689_c34_0085_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_da8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2653_c3_a8e6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_left;
     BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_return_output := BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_da8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2671_c32_8806_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2671_c32_0a8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2638_c3_907b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2653_c3_a8e6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2668_c3_3702_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2681_c24_3155_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2689_c24_c085_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2697_c24_9c5c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2631_l2646_l2661_DUPLICATE_9b18_return_output;
     VAR_printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2620_c1_1071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_da8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- l16_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := l16_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2695_c7_032f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;

     -- MUX[uxn_opcodes_h_l2671_c32_8806] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2671_c32_8806_cond <= VAR_MUX_uxn_opcodes_h_l2671_c32_8806_cond;
     MUX_uxn_opcodes_h_l2671_c32_8806_iftrue <= VAR_MUX_uxn_opcodes_h_l2671_c32_8806_iftrue;
     MUX_uxn_opcodes_h_l2671_c32_8806_iffalse <= VAR_MUX_uxn_opcodes_h_l2671_c32_8806_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2671_c32_8806_return_output := MUX_uxn_opcodes_h_l2671_c32_8806_return_output;

     -- printf_uxn_opcodes_h_l2621_c3_b635[uxn_opcodes_h_l2621_c3_b635] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2621_c3_b635_uxn_opcodes_h_l2621_c3_b635_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := t16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2695_c7_032f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     n16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     n16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := n16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2691_c7_e42c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2695_c7_032f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue := VAR_MUX_uxn_opcodes_h_l2671_c32_8806_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2695_c7_032f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2691_c7_e42c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     n16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     n16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := n16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2687_c7_fa5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := t16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2691_c7_e42c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := l16_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2691_c7_e42c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2691_c7_e42c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     -- t16_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2687_c7_fa5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2683_c7_3c49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2687_c7_fa5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2687_c7_fa5e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := n16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- l16_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := l16_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2687_c7_fa5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     -- l16_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2679_c7_37b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2683_c7_3c49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;

     -- n16_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := t16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2683_c7_3c49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2683_c7_3c49] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output := result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2683_c7_3c49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- t16_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2679_c7_37b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2679_c7_37b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     l16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     l16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := l16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2673_c7_b746] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;

     -- n16_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := n16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2679_c7_37b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2679_c7_37b2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;
     -- l16_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     l16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     l16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := l16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- n16_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := n16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2673_c7_b746] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_return_output := result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2673_c7_b746] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2673_c7_b746] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2673_c7_b746_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- l16_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := l16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2667_c7_b79a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2667_c7_b79a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := n16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- l16_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_91c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_91c9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- n16_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2659_c7_0e13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;

     -- l16_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := l16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2659_c7_0e13_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2656_c7_e1c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- l16_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := l16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2656_c7_e1c9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- l16_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2652_c7_0465] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2652_c7_0465_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_c553] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;

     -- l16_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := l16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_c553_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- l16_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2644_c7_65fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2644_c7_65fd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2641_c7_6f6f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_6f6f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2637_c7_cb62] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output := result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2637_c7_cb62_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2634_c7_dc00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2634_c7_dc00_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2629_c7_6fe5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2629_c7_6fe5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_5e30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_5e30_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2620_c2_fc8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2704_l2616_DUPLICATE_eac2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2704_l2616_DUPLICATE_eac2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c2_fc8a_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2704_l2616_DUPLICATE_eac2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2704_l2616_DUPLICATE_eac2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
