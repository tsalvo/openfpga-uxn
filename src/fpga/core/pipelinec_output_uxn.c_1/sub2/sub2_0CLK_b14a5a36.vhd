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
-- Submodules: 124
entity sub2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_b14a5a36;
architecture arch of sub2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_a835]
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_3bb2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal t16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal n16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1615_c2_66b0]
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1616_c3_dfe2[uxn_opcodes_h_l1616_c3_dfe2]
signal printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_30f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1623_c7_363e]
signal t16_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1623_c7_363e]
signal n16_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_363e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1623_c7_363e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_363e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1623_c7_363e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_363e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1623_c7_363e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1623_c7_363e]
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1623_c7_363e]
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_70fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1627_c7_9152]
signal t16_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1627_c7_9152]
signal n16_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_9152]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_9152]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_9152]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_9152]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_9152]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_9152]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_9152]
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1627_c7_9152]
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_c472]
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1633_c7_dbb4]
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_b414]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1637_c7_da96]
signal t16_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c7_da96]
signal n16_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_da96]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_da96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_da96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_da96]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_da96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_da96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_da96]
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1637_c7_da96]
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1638_c3_cc3a]
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_f106]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1642_c7_2602]
signal n16_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_2602]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_2602]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_2602]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1642_c7_2602]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_2602]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_2602]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1642_c7_2602]
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1642_c7_2602]
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_854c]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal n16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1646_c7_f25e]
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_c656]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal n16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1652_c7_eaee]
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3ce1]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal n16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1656_c7_0be0]
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1657_c3_9b96]
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l1658_c11_456d]
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1661_c32_929b]
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1661_c32_ecb3]
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1661_c32_7ddf]
signal MUX_uxn_opcodes_h_l1661_c32_7ddf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_7ddf_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_7ddf_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_7ddf_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_952b]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_d873]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_d873]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_d873]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_d873]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_d873]
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_0207]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_5929]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_5929]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_5929]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1669_c7_5929]
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1672_c34_8554]
signal CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_34fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_8d4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_8d4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_left,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_right,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_return_output);

-- t16_MUX_uxn_opcodes_h_l1615_c2_66b0
t16_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
t16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- n16_MUX_uxn_opcodes_h_l1615_c2_66b0
n16_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
n16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0
tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond,
tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

-- printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2
printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2 : entity work.printf_uxn_opcodes_h_l1616_c3_dfe2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output);

-- t16_MUX_uxn_opcodes_h_l1623_c7_363e
t16_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
t16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
t16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
t16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- n16_MUX_uxn_opcodes_h_l1623_c7_363e
n16_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
n16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
n16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
n16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1623_c7_363e
tmp16_MUX_uxn_opcodes_h_l1623_c7_363e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_cond,
tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output);

-- t16_MUX_uxn_opcodes_h_l1627_c7_9152
t16_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
t16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
t16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
t16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- n16_MUX_uxn_opcodes_h_l1627_c7_9152
n16_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
n16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
n16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
n16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1627_c7_9152
tmp16_MUX_uxn_opcodes_h_l1627_c7_9152 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_cond,
tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue,
tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse,
tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_left,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_right,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output);

-- t16_MUX_uxn_opcodes_h_l1633_c7_dbb4
t16_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- n16_MUX_uxn_opcodes_h_l1633_c7_dbb4
n16_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4
tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond,
tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output);

-- t16_MUX_uxn_opcodes_h_l1637_c7_da96
t16_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
t16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
t16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
t16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c7_da96
n16_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
n16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1637_c7_da96
tmp16_MUX_uxn_opcodes_h_l1637_c7_da96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_cond,
tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue,
tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse,
tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a
BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_left,
BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_right,
BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output);

-- n16_MUX_uxn_opcodes_h_l1642_c7_2602
n16_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
n16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
n16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
n16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1642_c7_2602
tmp16_MUX_uxn_opcodes_h_l1642_c7_2602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_cond,
tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue,
tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse,
tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output);

-- n16_MUX_uxn_opcodes_h_l1646_c7_f25e
n16_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
n16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e
tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond,
tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output);

-- n16_MUX_uxn_opcodes_h_l1652_c7_eaee
n16_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
n16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee
tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond,
tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue,
tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse,
tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output);

-- n16_MUX_uxn_opcodes_h_l1656_c7_0be0
n16_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
n16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0
tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond,
tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96
BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_left,
BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_right,
BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_left,
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_right,
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b
BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_left,
BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_right,
BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3
BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_left,
BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_right,
BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_return_output);

-- MUX_uxn_opcodes_h_l1661_c32_7ddf
MUX_uxn_opcodes_h_l1661_c32_7ddf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1661_c32_7ddf_cond,
MUX_uxn_opcodes_h_l1661_c32_7ddf_iftrue,
MUX_uxn_opcodes_h_l1661_c32_7ddf_iffalse,
MUX_uxn_opcodes_h_l1661_c32_7ddf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_cond,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_cond,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1672_c34_8554
CONST_SR_8_uxn_opcodes_h_l1672_c34_8554 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_x,
CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_return_output,
 t16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 n16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output,
 t16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 n16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output,
 t16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 n16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output,
 t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output,
 t16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output,
 n16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output,
 n16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output,
 n16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output,
 n16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_return_output,
 MUX_uxn_opcodes_h_l1661_c32_7ddf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_return_output,
 CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_25d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_151f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_f3f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_e61c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_dcc9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_c13b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_2e48 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_edf4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_0be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_0c56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_fa79_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_fc0e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_96bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1647_l1657_l1628_l1638_DUPLICATE_fb5a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_1023_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1611_l1679_DUPLICATE_b1c3_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_edf4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_edf4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_fc0e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_fc0e;
     VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_f3f3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_f3f3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_dcc9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_dcc9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_e61c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_e61c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_c13b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_c13b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_0c56 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_0c56;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_2e48 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_2e48;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_151f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_151f;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_25d2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_25d2;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_a835] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_left;
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output := BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_c472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_left;
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output := BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1667_c24_fa79] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_fa79_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_0be0_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_854c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_952b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_70fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_1023 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_1023_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3ce1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1647_l1657_l1628_l1638_DUPLICATE_fb5a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1647_l1657_l1628_l1638_DUPLICATE_fb5a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1672_c34_8554] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_return_output := CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_0207] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_f106] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_66b0_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_34fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_c656] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_b414] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1661_c32_929b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_left;
     BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_return_output := BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_30f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_929b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_a835_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_30f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_70fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_c472_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_b414_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f106_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_854c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_c656_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3ce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_952b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_0207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_34fd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1647_l1657_l1628_l1638_DUPLICATE_fb5a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1647_l1657_l1628_l1638_DUPLICATE_fb5a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1647_l1657_l1628_l1638_DUPLICATE_fb5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_fa79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_6cf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_l1669_DUPLICATE_383e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1663_l1652_l1646_l1642_l1633_l1637_l1627_l1623_l1615_DUPLICATE_1477_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1674_l1623_DUPLICATE_442b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_1023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_1023_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1652_l1656_l1646_l1642_l1633_l1637_l1627_l1623_l1669_l1615_DUPLICATE_c277_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_66b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_0be0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_5929] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1661_c32_ecb3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_left;
     BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_return_output := BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1638_c3_cc3a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_left;
     BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_return_output := BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1657_c3_9b96] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_left;
     BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output := BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_d873] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_8d4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_8d4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1672_c24_96bc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_96bc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_8554_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_3bb2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_ecb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_cc3a_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_9b96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_96bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_f34a_return_output;
     VAR_printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3bb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_8d4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_5929] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := n16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     t16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     t16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := t16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_5929] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1669_c7_5929] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_return_output := result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_d873] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;

     -- printf_uxn_opcodes_h_l1616_c3_dfe2[uxn_opcodes_h_l1616_c3_dfe2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1616_c3_dfe2_uxn_opcodes_h_l1616_c3_dfe2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1661_c32_7ddf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1661_c32_7ddf_cond <= VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_cond;
     MUX_uxn_opcodes_h_l1661_c32_7ddf_iftrue <= VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_iftrue;
     MUX_uxn_opcodes_h_l1661_c32_7ddf_iffalse <= VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_return_output := MUX_uxn_opcodes_h_l1661_c32_7ddf_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l1658_c11_456d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_left;
     BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_return_output := BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_456d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue := VAR_MUX_uxn_opcodes_h_l1661_c32_7ddf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_5929_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_d873] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_d873] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_return_output := result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_d873] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;

     -- t16_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := n16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d873_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := n16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- t16_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     t16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     t16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := t16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_0be0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_0be0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     t16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     t16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := t16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     n16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     n16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := n16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_eaee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_eaee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- t16_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := t16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     n16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := n16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_f25e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_f25e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- n16_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1642_c7_2602] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_return_output := result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_2602_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     n16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     n16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := n16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_da96] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_return_output := result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_da96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     n16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     n16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := n16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_dbb4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dbb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- n16_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := n16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_9152] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_9152_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1623_c7_363e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_363e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_66b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1611_l1679_DUPLICATE_b1c3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1611_l1679_DUPLICATE_b1c3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_66b0_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1611_l1679_DUPLICATE_b1c3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l1611_l1679_DUPLICATE_b1c3_return_output;
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
