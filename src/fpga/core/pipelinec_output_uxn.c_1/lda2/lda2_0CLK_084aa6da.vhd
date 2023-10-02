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
-- Submodules: 132
entity lda2_0CLK_084aa6da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_084aa6da;
architecture arch of lda2_0CLK_084aa6da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_d96e]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_407b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal t16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c2_a4be]
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1068_c3_8be7[uxn_opcodes_h_l1068_c3_8be7]
signal printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_5483]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal t16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1075_c7_aa15]
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_b7dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal t16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1079_c7_c64a]
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1081_c3_4f3c]
signal CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_a0f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1085_c7_8e9f]
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_3071]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1089_c7_ef5c]
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1090_c3_3792]
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1093_c32_6b91]
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1093_c32_87a0]
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1093_c32_9d85]
signal MUX_uxn_opcodes_h_l1093_c32_9d85_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_9d85_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_9d85_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_9d85_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_9784]
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1095_c7_fe75]
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_4a17]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1101_c7_80ea]
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_80ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1101_c7_80ea]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_80ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_80ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_80ea]
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1101_c7_80ea]
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_179a]
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1105_c7_9035]
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_9035]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1105_c7_9035]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_9035]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_9035]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_9035]
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1105_c7_9035]
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1107_c3_3520]
signal CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1109_c21_0a87]
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_0c88]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1111_c7_d991]
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_d991]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1111_c7_d991]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_d991]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_d991]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_d991]
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c7_d991]
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1113_c21_636f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_9afe]
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_752d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_752d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_752d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_752d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_752d]
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1115_c7_752d]
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1116_c3_8950]
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1122_c11_9245]
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1122_c7_26f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1122_c7_26f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1122_c7_26f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1122_c7_26f1]
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1125_c34_aa93]
signal CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_d521]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_aa3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_aa3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5a54( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.is_stack_read := ref_toks_10;
      base.stack_value := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_return_output);

-- t16_MUX_uxn_opcodes_h_l1067_c2_a4be
t16_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
t16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be
tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

-- printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7
printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7 : entity work.printf_uxn_opcodes_h_l1068_c3_8be7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output);

-- t16_MUX_uxn_opcodes_h_l1075_c7_aa15
t16_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
t16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15
tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond,
tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue,
tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse,
tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output);

-- t16_MUX_uxn_opcodes_h_l1079_c7_c64a
t16_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
t16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a
tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond,
tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c
CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_x,
CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output);

-- t16_MUX_uxn_opcodes_h_l1085_c7_8e9f
t16_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f
tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond,
tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output);

-- t16_MUX_uxn_opcodes_h_l1089_c7_ef5c
t16_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c
tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond,
tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792
BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_left,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_right,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91
BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_left,
BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_right,
BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0
BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_left,
BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_right,
BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_return_output);

-- MUX_uxn_opcodes_h_l1093_c32_9d85
MUX_uxn_opcodes_h_l1093_c32_9d85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1093_c32_9d85_cond,
MUX_uxn_opcodes_h_l1093_c32_9d85_iftrue,
MUX_uxn_opcodes_h_l1093_c32_9d85_iffalse,
MUX_uxn_opcodes_h_l1093_c32_9d85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_left,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_right,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75
tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_cond,
tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue,
tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse,
tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea
tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_cond,
tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue,
tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse,
tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_left,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_right,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_cond,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1105_c7_9035
tmp16_MUX_uxn_opcodes_h_l1105_c7_9035 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_cond,
tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue,
tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse,
tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1107_c3_3520
CONST_SL_8_uxn_opcodes_h_l1107_c3_3520 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_x,
CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_left,
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_right,
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_cond,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c7_d991
tmp16_MUX_uxn_opcodes_h_l1111_c7_d991 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_left,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_right,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1115_c7_752d
tmp16_MUX_uxn_opcodes_h_l1115_c7_752d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_cond,
tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950
BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_left,
BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_right,
BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_left,
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_right,
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93
CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_x,
CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_return_output,
 t16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output,
 t16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output,
 t16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output,
 t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output,
 t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_return_output,
 MUX_uxn_opcodes_h_l1093_c32_9d85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output,
 tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_return_output,
 tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_return_output,
 CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_1983 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_c784 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_3fc8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_4d25 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_ef5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_4af8 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_26fb : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_1d4c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_2597_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_6311 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_28b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_98ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_aba9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5a54_uxn_opcodes_h_l1132_l1063_DUPLICATE_6e53_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_c784 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_c784;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_1983 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_1983;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_6311 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_6311;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_4d25 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_4d25;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_3fc8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_3fc8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_1d4c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_1d4c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_right := to_unsigned(11, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_d521] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_179a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_a4be_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1093_c32_6b91] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_left;
     BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_return_output := BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_5483] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_d96e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_0c88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_98ed LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_98ed_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_aba9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_aba9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_ef5c_return_output := result.is_stack_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1109_c21_0a87] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_9784] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_left;
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output := BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l1125_c34_aa93] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_return_output := CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_3071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_9afe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_4a17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1113_c21_636f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_a0f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1122_c11_9245] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_left;
     BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output := BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_b7dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_6b91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_d96e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_5483_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b7dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a0f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_3071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_9784_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_4a17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_179a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_0c88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_9afe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_9245_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_d521_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_4af8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_0a87_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_26fb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_636f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_98ed_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_98ed_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_aba9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_aba9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b128_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_c0aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_188c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_526f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_b5da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_7fb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_a70d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_2042_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_2f89_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_a4be_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_4af8;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_26fb;
     -- BIN_OP_OR[uxn_opcodes_h_l1116_c3_8950] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_left;
     BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output := BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_407b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_752d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1090_c3_3792] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_left;
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_return_output := BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1122_c7_26f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1093_c32_87a0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_left;
     BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_return_output := BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1107_c3_3520] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_return_output := CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1111_c7_d991] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_aa3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1125_c24_28b8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_28b8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_aa93_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_aa3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1081_c3_4f3c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_return_output := CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_87a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_3792_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_28b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_4f3c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_3520_return_output;
     VAR_printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_407b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_aa3a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1122_c7_26f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1120_c24_2597] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_2597_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_8950_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1122_c7_26f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;

     -- printf_uxn_opcodes_h_l1068_c3_8be7[uxn_opcodes_h_l1068_c3_8be7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1068_c3_8be7_uxn_opcodes_h_l1068_c3_8be7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1115_c7_752d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_cond;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_return_output := tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1111_c7_d991] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_752d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1122_c7_26f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1105_c7_9035] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- MUX[uxn_opcodes_h_l1093_c32_9d85] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1093_c32_9d85_cond <= VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_cond;
     MUX_uxn_opcodes_h_l1093_c32_9d85_iftrue <= VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_iftrue;
     MUX_uxn_opcodes_h_l1093_c32_9d85_iffalse <= VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_return_output := MUX_uxn_opcodes_h_l1093_c32_9d85_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_2597_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue := VAR_MUX_uxn_opcodes_h_l1093_c32_9d85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_26f1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_752d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c7_d991] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_752d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_752d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_d991] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1101_c7_80ea] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1105_c7_9035] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;

     -- t16_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_752d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_d991] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_d991] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_return_output := result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_9035] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1105_c7_9035] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_cond;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_return_output := tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;

     -- t16_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := t16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_d991] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1101_c7_80ea] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_d991_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- t16_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := t16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_9035] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_9035] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1101_c7_80ea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_cond;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output := tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_9035] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_return_output := result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_80ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_9035_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_80ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_80ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_80ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := t16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_80ea_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_fe75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_fe75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_ef5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_ef5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_8e9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_8e9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_c64a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_c64a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_aa15] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output := result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_aa15_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1067_c2_a4be] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output := result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5a54_uxn_opcodes_h_l1132_l1063_DUPLICATE_6e53 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5a54_uxn_opcodes_h_l1132_l1063_DUPLICATE_6e53_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5a54(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_a4be_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5a54_uxn_opcodes_h_l1132_l1063_DUPLICATE_6e53_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5a54_uxn_opcodes_h_l1132_l1063_DUPLICATE_6e53_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
