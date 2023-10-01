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
-- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_3f7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_239b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1615_c2_5763]
signal n16_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1615_c2_5763]
signal t16_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1615_c2_5763]
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1615_c2_5763]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1616_c3_c0dd[uxn_opcodes_h_l1616_c3_c0dd]
signal printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_2fef]
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal n16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal t16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1623_c7_0eee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_9b12]
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_8a2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_465e]
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_bb9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_98b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal n16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal t16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_7f54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1638_c3_d839]
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_9ff2]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal n16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_dde5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_0c4f]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1646_c7_3051]
signal n16_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1646_c7_3051]
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_3051]
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1646_c7_3051]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_3051]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_3051]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_3051]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_3051]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_3051]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_d38b]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal n16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_44c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3c03]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal n16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_c76a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1657_c3_a343]
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l1658_c11_52af]
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1661_c32_f7ae]
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1661_c32_4e3d]
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1661_c32_4975]
signal MUX_uxn_opcodes_h_l1661_c32_4975_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_4975_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_4975_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1661_c32_4975_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_e112]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_39a2]
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_39a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_39a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_39a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_39a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_9fb0]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_6f7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_6f7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1669_c7_6f7b]
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_6f7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1672_c34_739f]
signal CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_6249]
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_b71e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_b71e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_return_output);

-- n16_MUX_uxn_opcodes_h_l1615_c2_5763
n16_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
n16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
n16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
n16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- t16_MUX_uxn_opcodes_h_l1615_c2_5763
t16_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
t16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
t16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
t16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1615_c2_5763
tmp16_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

-- printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd
printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd : entity work.printf_uxn_opcodes_h_l1616_c3_c0dd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_left,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_right,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output);

-- n16_MUX_uxn_opcodes_h_l1623_c7_0eee
n16_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
n16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- t16_MUX_uxn_opcodes_h_l1623_c7_0eee
t16_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
t16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee
tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_left,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_right,
BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output);

-- n16_MUX_uxn_opcodes_h_l1627_c7_8a2c
n16_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- t16_MUX_uxn_opcodes_h_l1627_c7_8a2c
t16_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c
tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_left,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_right,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output);

-- n16_MUX_uxn_opcodes_h_l1633_c7_bb9e
n16_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- t16_MUX_uxn_opcodes_h_l1633_c7_bb9e
t16_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e
tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c7_7f54
n16_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- t16_MUX_uxn_opcodes_h_l1637_c7_7f54
t16_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
t16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54
tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839
BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_left,
BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_right,
BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output);

-- n16_MUX_uxn_opcodes_h_l1642_c7_dde5
n16_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
n16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5
tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output);

-- n16_MUX_uxn_opcodes_h_l1646_c7_3051
n16_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
n16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
n16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
n16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1646_c7_3051
tmp16_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output);

-- n16_MUX_uxn_opcodes_h_l1652_c7_44c5
n16_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
n16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5
tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output);

-- n16_MUX_uxn_opcodes_h_l1656_c7_c76a
n16_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
n16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a
tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343
BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_left,
BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_right,
BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_left,
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_right,
BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae
BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_left,
BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_right,
BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d
BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_left,
BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_right,
BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_return_output);

-- MUX_uxn_opcodes_h_l1661_c32_4975
MUX_uxn_opcodes_h_l1661_c32_4975 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1661_c32_4975_cond,
MUX_uxn_opcodes_h_l1661_c32_4975_iftrue,
MUX_uxn_opcodes_h_l1661_c32_4975_iffalse,
MUX_uxn_opcodes_h_l1661_c32_4975_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1672_c34_739f
CONST_SR_8_uxn_opcodes_h_l1672_c34_739f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_x,
CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_left,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_right,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_return_output,
 n16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 t16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output,
 n16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 t16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output,
 n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output,
 n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 t16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output,
 n16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output,
 n16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output,
 n16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output,
 n16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_return_output,
 MUX_uxn_opcodes_h_l1661_c32_4975_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_4b83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_d510 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_d7cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_2e20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_4ffc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_a823 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_cee3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_6446 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_c76a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_4975_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_4975_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_4975_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1661_c32_4975_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_5baa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_9098_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_bf2a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_69ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1638_l1657_l1628_l1647_DUPLICATE_9fdf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_4257_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1611_l1679_DUPLICATE_54a1_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1661_c32_4975_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_cee3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1650_c3_cee3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_bf2a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_bf2a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_d510 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1625_c3_d510;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_a823 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_a823;
     VAR_MUX_uxn_opcodes_h_l1661_c32_4975_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_4b83 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_4b83;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_4ffc := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1640_c3_4ffc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_2e20 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_2e20;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_5baa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_5baa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_6446 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_6446;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_d7cc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_d7cc;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_6249] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_left;
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output := BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_9fb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1667_c24_9098] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_9098_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_3f7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_5763_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_465e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_2fef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_4257 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_4257_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1672_c34_739f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_return_output := CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_e112] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_d38b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_c76a_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_0c4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1627_c11_9b12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_9ff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_98b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1638_l1657_l1628_l1647_DUPLICATE_9fdf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1638_l1657_l1628_l1647_DUPLICATE_9fdf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1661_c32_f7ae] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_left;
     BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_return_output := BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_3c03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1661_c32_f7ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_3f7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_2fef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1627_c11_9b12_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_465e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_98b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_9ff2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_0c4f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_d38b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_3c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_e112_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_9fb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_6249_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1638_l1657_l1628_l1647_DUPLICATE_9fdf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1638_l1657_l1628_l1647_DUPLICATE_9fdf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1638_l1657_l1628_l1647_DUPLICATE_9fdf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1667_c24_9098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_DUPLICATE_cdda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1669_l1633_l1663_DUPLICATE_dae9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1633_l1663_DUPLICATE_3ed7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1642_l1674_l1637_l1633_DUPLICATE_8d94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_4257_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1669_l1656_DUPLICATE_4257_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1656_l1627_l1652_l1623_l1646_l1615_l1642_l1637_l1669_l1633_DUPLICATE_3a0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1615_c2_5763_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1656_c7_c76a_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1672_c24_69ce] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_69ce_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1672_c34_739f_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_b71e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1657_c3_a343] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_left;
     BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output := BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_6f7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1661_c32_4e3d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_left;
     BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_return_output := BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_239b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_b71e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1638_c3_d839] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_left;
     BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_return_output := BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_39a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1661_c32_4975_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1661_c32_4e3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1638_c3_d839_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1657_c3_a343_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1672_c24_69ce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1648_l1629_DUPLICATE_c0cb_return_output;
     VAR_printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_239b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_b71e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1669_c7_6f7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := t16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- printf_uxn_opcodes_h_l1616_c3_c0dd[uxn_opcodes_h_l1616_c3_c0dd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1616_c3_c0dd_uxn_opcodes_h_l1616_c3_c0dd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_6f7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_39a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := n16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- MUX[uxn_opcodes_h_l1661_c32_4975] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1661_c32_4975_cond <= VAR_MUX_uxn_opcodes_h_l1661_c32_4975_cond;
     MUX_uxn_opcodes_h_l1661_c32_4975_iftrue <= VAR_MUX_uxn_opcodes_h_l1661_c32_4975_iftrue;
     MUX_uxn_opcodes_h_l1661_c32_4975_iffalse <= VAR_MUX_uxn_opcodes_h_l1661_c32_4975_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1661_c32_4975_return_output := MUX_uxn_opcodes_h_l1661_c32_4975_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1669_c7_6f7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l1658_c11_52af] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_left;
     BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_return_output := BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l1658_c11_52af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue := VAR_MUX_uxn_opcodes_h_l1661_c32_4975_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1669_c7_6f7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_39a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_39a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_39a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := n16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_39a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     n16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     n16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := n16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1656_c7_c76a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1656_c7_c76a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- n16_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := n16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_44c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- t16_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := t16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1652_c7_44c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := n16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1646_c7_3051] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;

     -- t16_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     t16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     t16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := t16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1646_c7_3051_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1642_c7_dde5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1642_c7_dde5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1637_c7_7f54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1637_c7_7f54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := n16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_bb9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_bb9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     n16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     n16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := n16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1627_c7_8a2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1627_c7_8a2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1623_c7_0eee] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output := result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1623_c7_0eee_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_5763] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1611_l1679_DUPLICATE_54a1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1611_l1679_DUPLICATE_54a1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_5763_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1615_c2_5763_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1611_l1679_DUPLICATE_54a1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l1611_l1679_DUPLICATE_54a1_return_output;
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
