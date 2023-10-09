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
entity jsr2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_3a9c1537;
architecture arch of jsr2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l852_c6_55fd]
signal BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l852_c1_c948]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l852_c2_b98f]
signal t16_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l852_c2_b98f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l853_c3_9f02[uxn_opcodes_h_l853_c3_9f02]
signal printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l858_c11_d0ba]
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l858_c7_8299]
signal t16_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_pc_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l858_c7_8299]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l861_c11_c02a]
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l861_c7_ad26]
signal t16_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l861_c7_ad26]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l863_c3_1e01]
signal CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_0995]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_3d87]
signal t16_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l866_c7_3d87]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_b977]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_b038]
signal t16_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_pc_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l869_c7_b038]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l870_c3_83e5]
signal BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l873_c32_b876]
signal BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l873_c32_7c89]
signal BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l873_c32_c0f5]
signal MUX_uxn_opcodes_h_l873_c32_c0f5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l873_c32_c0f5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l873_c32_c0f5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l873_c32_c0f5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_36de]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_pc_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l875_c7_0327]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l879_c11_ef96]
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l879_c7_4ae3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l885_c11_c9e1]
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l885_c7_d952]
signal result_pc_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l885_c7_d952]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l885_c7_d952]
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_d952]
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l885_c7_d952]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_d952]
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_d952]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l887_c34_a1c3]
signal CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_bcac]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_ac08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_ac08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l891_c7_ac08]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l891_c7_ac08]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_fe28( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
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
      base.is_stack_read := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.is_stack_index_flipped := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd
BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_left,
BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_right,
BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_return_output);

-- t16_MUX_uxn_opcodes_h_l852_c2_b98f
t16_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
t16_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
t16_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
t16_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l852_c2_b98f
result_pc_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f
result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f
result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f
result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f
result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f
result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

-- printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02
printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02 : entity work.printf_uxn_opcodes_h_l853_c3_9f02_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba
BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_left,
BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_right,
BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output);

-- t16_MUX_uxn_opcodes_h_l858_c7_8299
t16_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l858_c7_8299_cond,
t16_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
t16_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
t16_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_pc_MUX_uxn_opcodes_h_l858_c7_8299
result_pc_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_pc_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299
result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_left,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_right,
BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output);

-- t16_MUX_uxn_opcodes_h_l861_c7_ad26
t16_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
t16_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
t16_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
t16_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_pc_MUX_uxn_opcodes_h_l861_c7_ad26
result_pc_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26
result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26
result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_return_output);

-- CONST_SL_8_uxn_opcodes_h_l863_c3_1e01
CONST_SL_8_uxn_opcodes_h_l863_c3_1e01 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_x,
CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995
BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_3d87
t16_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
t16_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_pc_MUX_uxn_opcodes_h_l866_c7_3d87
result_pc_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87
result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87
result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87
result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977
BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_b038
t16_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_b038_cond,
t16_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_pc_MUX_uxn_opcodes_h_l869_c7_b038
result_pc_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_pc_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038
result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038
result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038
result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5
BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_left,
BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_right,
BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l873_c32_b876
BIN_OP_AND_uxn_opcodes_h_l873_c32_b876 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_left,
BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_right,
BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89
BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_left,
BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_right,
BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_return_output);

-- MUX_uxn_opcodes_h_l873_c32_c0f5
MUX_uxn_opcodes_h_l873_c32_c0f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l873_c32_c0f5_cond,
MUX_uxn_opcodes_h_l873_c32_c0f5_iftrue,
MUX_uxn_opcodes_h_l873_c32_c0f5_iffalse,
MUX_uxn_opcodes_h_l873_c32_c0f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de
BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output);

-- result_pc_MUX_uxn_opcodes_h_l875_c7_0327
result_pc_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_pc_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327
result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327
result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96
BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_left,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_right,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output);

-- result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3
result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3
result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3
result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1
BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_left,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_right,
BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l885_c7_d952
result_pc_MUX_uxn_opcodes_h_l885_c7_d952 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l885_c7_d952_cond,
result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iftrue,
result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iffalse,
result_pc_MUX_uxn_opcodes_h_l885_c7_d952_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952
result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_cond,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_return_output);

-- CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3
CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_x,
CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac
BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08
result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_return_output,
 t16_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output,
 t16_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_pc_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output,
 t16_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_return_output,
 CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_pc_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_return_output,
 BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_return_output,
 BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_return_output,
 MUX_uxn_opcodes_h_l873_c32_c0f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output,
 result_pc_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output,
 result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output,
 result_pc_MUX_uxn_opcodes_h_l885_c7_d952_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_return_output,
 CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_3c46 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_138d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_2e03 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_a5a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l877_c3_0470 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l882_c3_3c36 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l883_c24_0016_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_1fbf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l887_c24_8271_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l861_l866_l858_l869_DUPLICATE_4b12_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l862_l870_DUPLICATE_aea8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l869_l885_DUPLICATE_cdff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l898_l848_DUPLICATE_7841_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_a5a1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_a5a1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l877_c3_0470 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l877_c3_0470;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l882_c3_3c36 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l882_c3_3c36;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_3c46 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_3c46;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_138d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_138d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_2e03 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_2e03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_1fbf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l886_c3_1fbf;

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_left := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l862_l870_DUPLICATE_aea8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l862_l870_DUPLICATE_aea8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l873_c32_b876] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_left;
     BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_return_output := BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l879_c11_ef96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_left;
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output := BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_bcac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l885_c11_c9e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output := result.pc;

     -- CONST_SR_8[uxn_opcodes_h_l887_c34_a1c3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_return_output := CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l861_c11_c02a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_left;
     BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output := BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_36de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l883_c24_0016] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l883_c24_0016_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l852_c6_55fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_b977] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_0995] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l869_l885_DUPLICATE_cdff LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l869_l885_DUPLICATE_cdff_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l861_l866_l858_l869_DUPLICATE_4b12 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l861_l866_l858_l869_DUPLICATE_4b12_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l858_c11_d0ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_left := VAR_BIN_OP_AND_uxn_opcodes_h_l873_c32_b876_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c6_55fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l858_c11_d0ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l861_c11_c02a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_0995_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_b977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_36de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_ef96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l885_c11_c9e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_bcac_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l862_l870_DUPLICATE_aea8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l862_l870_DUPLICATE_aea8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l883_c24_0016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l875_l866_l861_l858_DUPLICATE_8607_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l858_l885_DUPLICATE_f990_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l879_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_7bdd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l852_l879_l875_l869_l866_l861_l891_l858_DUPLICATE_2a0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l852_l879_l875_l866_l861_l858_DUPLICATE_7ab0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l852_l879_l869_l866_l861_l891_l858_l885_DUPLICATE_094f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l861_l866_l858_l869_DUPLICATE_4b12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l861_l866_l858_l869_DUPLICATE_4b12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l861_l866_l858_l869_DUPLICATE_4b12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l861_l866_l858_l869_DUPLICATE_4b12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l891_l858_l885_DUPLICATE_4d98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l869_l885_DUPLICATE_cdff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l869_l885_DUPLICATE_cdff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l875_l869_l885_DUPLICATE_cdff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l852_l875_l869_l866_l861_l858_l885_DUPLICATE_ff23_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l852_c1_c948] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l873_c32_7c89] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_left;
     BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_return_output := BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l891_c7_ac08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l887_c24_8271] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l887_c24_8271_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l887_c34_a1c3_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l885_c7_d952] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l891_c7_ac08] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_ac08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l863_c3_1e01] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_x <= VAR_CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_return_output := CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l891_c7_ac08] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l885_c7_d952] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l885_c7_d952_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_cond;
     result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iftrue;
     result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_return_output := result_pc_MUX_uxn_opcodes_h_l885_c7_d952_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l870_c3_83e5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_left;
     BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_return_output := BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l873_c32_7c89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l870_c3_83e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l887_c24_8271_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l863_c3_1e01_return_output;
     VAR_printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l852_c1_c948_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c7_ac08_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l885_c7_d952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l885_c7_d952_return_output;
     -- printf_uxn_opcodes_h_l853_c3_9f02[uxn_opcodes_h_l853_c3_9f02] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l853_c3_9f02_uxn_opcodes_h_l853_c3_9f02_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l885_c7_d952] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l885_c7_d952] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l885_c7_d952] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_cond;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_return_output := result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- MUX[uxn_opcodes_h_l873_c32_c0f5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l873_c32_c0f5_cond <= VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_cond;
     MUX_uxn_opcodes_h_l873_c32_c0f5_iftrue <= VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_iftrue;
     MUX_uxn_opcodes_h_l873_c32_c0f5_iffalse <= VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_return_output := MUX_uxn_opcodes_h_l873_c32_c0f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_return_output := t16_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l885_c7_d952] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l885_c7_d952] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue := VAR_MUX_uxn_opcodes_h_l873_c32_c0f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l885_c7_d952_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l885_c7_d952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l885_c7_d952_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l885_c7_d952_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l885_c7_d952_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_pc_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := t16_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_4ae3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l879_c7_4ae3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- t16_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     t16_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     t16_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := t16_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_pc_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_0327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l875_c7_0327_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_t16_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- t16_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     t16_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     t16_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_return_output := t16_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_b038] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l869_c7_b038_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- t16_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     t16_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     t16_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := t16_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l866_c7_3d87] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l866_c7_3d87_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l861_c7_ad26] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_pc_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l861_c7_ad26_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l858_c7_8299] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_cond;
     result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_return_output := result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l858_c7_8299_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l852_c2_b98f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l898_l848_DUPLICATE_7841 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l898_l848_DUPLICATE_7841_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fe28(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c2_b98f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l852_c2_b98f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l898_l848_DUPLICATE_7841_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l898_l848_DUPLICATE_7841_return_output;
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
