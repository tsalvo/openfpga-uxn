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
-- Submodules: 64
entity jmp2_0CLK_06911bbe is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_06911bbe;
architecture arch of jmp2_0CLK_06911bbe is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l601_c6_6b46]
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c1_b8c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l601_c2_fe52]
signal t16_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_fe52]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l602_c3_b2a0[uxn_opcodes_h_l602_c3_b2a0]
signal printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l609_c11_4fc1]
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l609_c7_8a65]
signal t16_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_8a65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_8a65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l609_c7_8a65]
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_8a65]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_8a65]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_8a65]
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_8a65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l613_c11_a292]
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal t16_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_b1b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : signed(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l615_c3_6fc2]
signal CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l619_c11_dee7]
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l619_c7_dc75]
signal t16_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l619_c7_dc75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l619_c7_dc75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l619_c7_dc75]
signal result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l619_c7_dc75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l619_c7_dc75]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l619_c7_dc75]
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l619_c7_dc75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l623_c11_e474]
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l623_c7_848f]
signal t16_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_848f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l623_c7_848f]
signal result_pc_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l623_c7_848f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_848f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l623_c7_848f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_848f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output : signed(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l624_c3_957b]
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l627_c32_85b8]
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l627_c32_7711]
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l627_c32_44ec]
signal MUX_uxn_opcodes_h_l627_c32_44ec_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_44ec_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_44ec_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l627_c32_44ec_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_f57c]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l629_c7_61c5]
signal result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_61c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_61c5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_61c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l634_c11_4650]
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l634_c7_5566]
signal result_pc_MUX_uxn_opcodes_h_l634_c7_5566_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c7_5566_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c7_5566]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l634_c7_5566]
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_eeed( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46
BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_left,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_right,
BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_return_output);

-- t16_MUX_uxn_opcodes_h_l601_c2_fe52
t16_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
t16_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
t16_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
t16_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_pc_MUX_uxn_opcodes_h_l601_c2_fe52
result_pc_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

-- printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0
printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0 : entity work.printf_uxn_opcodes_h_l602_c3_b2a0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1
BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_left,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_right,
BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output);

-- t16_MUX_uxn_opcodes_h_l609_c7_8a65
t16_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
t16_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
t16_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
t16_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- result_pc_MUX_uxn_opcodes_h_l609_c7_8a65
result_pc_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_left,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_right,
BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output);

-- t16_MUX_uxn_opcodes_h_l613_c7_b1b9
t16_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
t16_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9
result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2
CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_x,
CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7
BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_left,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_right,
BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output);

-- t16_MUX_uxn_opcodes_h_l619_c7_dc75
t16_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
t16_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
t16_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
t16_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- result_pc_MUX_uxn_opcodes_h_l619_c7_dc75
result_pc_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474
BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_left,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_right,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output);

-- t16_MUX_uxn_opcodes_h_l623_c7_848f
t16_MUX_uxn_opcodes_h_l623_c7_848f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l623_c7_848f_cond,
t16_MUX_uxn_opcodes_h_l623_c7_848f_iftrue,
t16_MUX_uxn_opcodes_h_l623_c7_848f_iffalse,
t16_MUX_uxn_opcodes_h_l623_c7_848f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l623_c7_848f
result_pc_MUX_uxn_opcodes_h_l623_c7_848f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l623_c7_848f_cond,
result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iftrue,
result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iffalse,
result_pc_MUX_uxn_opcodes_h_l623_c7_848f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l624_c3_957b
BIN_OP_OR_uxn_opcodes_h_l624_c3_957b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_left,
BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_right,
BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8
BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_left,
BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_right,
BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l627_c32_7711
BIN_OP_GT_uxn_opcodes_h_l627_c32_7711 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_left,
BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_right,
BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_return_output);

-- MUX_uxn_opcodes_h_l627_c32_44ec
MUX_uxn_opcodes_h_l627_c32_44ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l627_c32_44ec_cond,
MUX_uxn_opcodes_h_l627_c32_44ec_iftrue,
MUX_uxn_opcodes_h_l627_c32_44ec_iffalse,
MUX_uxn_opcodes_h_l627_c32_44ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c
BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l629_c7_61c5
result_pc_MUX_uxn_opcodes_h_l629_c7_61c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_cond,
result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue,
result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse,
result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650
BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_left,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_right,
BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output);

-- result_pc_MUX_uxn_opcodes_h_l634_c7_5566
result_pc_MUX_uxn_opcodes_h_l634_c7_5566 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l634_c7_5566_cond,
result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iftrue,
result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iffalse,
result_pc_MUX_uxn_opcodes_h_l634_c7_5566_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_return_output,
 t16_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output,
 t16_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output,
 t16_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output,
 CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output,
 t16_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output,
 t16_MUX_uxn_opcodes_h_l623_c7_848f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_return_output,
 result_pc_MUX_uxn_opcodes_h_l623_c7_848f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_return_output,
 MUX_uxn_opcodes_h_l627_c32_44ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output,
 result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output,
 result_pc_MUX_uxn_opcodes_h_l634_c7_5566_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_e528 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_1de7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_5f02 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_c7b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_dc75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_848f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_44ec_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_44ec_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_44ec_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l627_c32_44ec_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l636_c3_49c2 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_ab08_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eeed_uxn_opcodes_h_l640_l597_DUPLICATE_1be3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_1de7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l611_c3_1de7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_c7b3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l621_c3_c7b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_5f02 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l617_c3_5f02;
     VAR_MUX_uxn_opcodes_h_l627_c32_44ec_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_e528 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_e528;
     VAR_MUX_uxn_opcodes_h_l627_c32_44ec_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_pc_uxn_opcodes_h_l636_c3_49c2 := resize(to_unsigned(0, 1), 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iftrue := VAR_result_pc_uxn_opcodes_h_l636_c3_49c2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l634_c11_4650] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_left;
     BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output := BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_fe52_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l627_c32_85b8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_left;
     BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_return_output := BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l623_c11_e474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_left;
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output := BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_dc75_return_output := result.stack_address_sp_offset;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_848f_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l613_c11_a292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_left;
     BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output := BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_fe52_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l609_c11_4fc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l619_c11_dee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_ab08 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_ab08_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l601_c6_6b46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_left;
     BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output := BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_f57c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output := result.pc;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_left := VAR_BIN_OP_AND_uxn_opcodes_h_l627_c32_85b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l601_c6_6b46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l609_c11_4fc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l613_c11_a292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l619_c11_dee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_e474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_f57c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c11_4650_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_ab08_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l624_l614_DUPLICATE_ab08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l623_l619_l613_l609_l601_DUPLICATE_5100_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_dcb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l634_l629_l623_l619_l613_l609_DUPLICATE_2ae4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l634_l623_l619_l613_l609_l601_DUPLICATE_603b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l619_l613_l609_l601_DUPLICATE_9563_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l601_c2_fe52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l623_c7_848f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l601_c2_fe52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l619_c7_dc75_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l634_c7_5566] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l634_c7_5566_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_cond;
     result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iftrue;
     result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_return_output := result_pc_MUX_uxn_opcodes_h_l634_c7_5566_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l627_c32_7711] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_left;
     BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_return_output := BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_61c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l615_c3_6fc2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_return_output := CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l634_c7_5566] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l601_c1_b8c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c7_5566] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l624_c3_957b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_left;
     BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_return_output := BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l627_c32_44ec_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l627_c32_7711_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l624_c3_957b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l615_c3_6fc2_return_output;
     VAR_printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l601_c1_b8c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c7_5566_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c7_5566_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l623_c7_848f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l634_c7_5566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_61c5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output;

     -- t16_MUX[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l623_c7_848f_cond <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_cond;
     t16_MUX_uxn_opcodes_h_l623_c7_848f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_iftrue;
     t16_MUX_uxn_opcodes_h_l623_c7_848f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_return_output := t16_MUX_uxn_opcodes_h_l623_c7_848f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l629_c7_61c5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_cond;
     result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_return_output := result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_61c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;

     -- MUX[uxn_opcodes_h_l627_c32_44ec] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l627_c32_44ec_cond <= VAR_MUX_uxn_opcodes_h_l627_c32_44ec_cond;
     MUX_uxn_opcodes_h_l627_c32_44ec_iftrue <= VAR_MUX_uxn_opcodes_h_l627_c32_44ec_iftrue;
     MUX_uxn_opcodes_h_l627_c32_44ec_iffalse <= VAR_MUX_uxn_opcodes_h_l627_c32_44ec_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l627_c32_44ec_return_output := MUX_uxn_opcodes_h_l627_c32_44ec_return_output;

     -- printf_uxn_opcodes_h_l602_c3_b2a0[uxn_opcodes_h_l602_c3_b2a0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l602_c3_b2a0_uxn_opcodes_h_l602_c3_b2a0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue := VAR_MUX_uxn_opcodes_h_l627_c32_44ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l629_c7_61c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_t16_MUX_uxn_opcodes_h_l623_c7_848f_return_output;
     -- t16_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     t16_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     t16_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := t16_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l623_c7_848f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_cond;
     result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_return_output := result_pc_MUX_uxn_opcodes_h_l623_c7_848f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_848f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_848f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_848f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l623_c7_848f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_848f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     -- t16_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := t16_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l619_c7_dc75] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_cond;
     result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iftrue;
     result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_return_output := result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l619_c7_dc75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_t16_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     -- t16_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     t16_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     t16_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := t16_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l613_c7_b1b9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_cond;
     result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output := result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l613_c7_b1b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_t16_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- t16_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     t16_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     t16_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := t16_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l609_c7_8a65] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_cond;
     result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iftrue;
     result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_return_output := result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l609_c7_8a65_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l601_c2_fe52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eeed_uxn_opcodes_h_l640_l597_DUPLICATE_1be3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eeed_uxn_opcodes_h_l640_l597_DUPLICATE_1be3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eeed(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l601_c2_fe52_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l601_c2_fe52_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eeed_uxn_opcodes_h_l640_l597_DUPLICATE_1be3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eeed_uxn_opcodes_h_l640_l597_DUPLICATE_1be3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
