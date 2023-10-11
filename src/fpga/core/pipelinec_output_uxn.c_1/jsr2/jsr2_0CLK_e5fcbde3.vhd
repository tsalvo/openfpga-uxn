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
-- Submodules: 99
entity jsr2_0CLK_e5fcbde3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_e5fcbde3;
architecture arch of jsr2_0CLK_e5fcbde3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l810_c6_d346]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l810_c1_391b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l810_c2_e3e1]
signal t16_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l811_c3_df57[uxn_opcodes_h_l811_c3_df57]
signal printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l815_c11_cd51]
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_pc_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l815_c7_805c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l815_c7_805c]
signal t16_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l818_c11_60b6]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_92aa]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l818_c7_92aa]
signal t16_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l820_c3_1b2f]
signal CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l823_c11_71e1]
signal BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l823_c7_6a87]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l823_c7_6a87]
signal t16_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l826_c11_1afc]
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_6dab]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l826_c7_6dab]
signal t16_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l827_c3_57d6]
signal BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l829_c32_ffe0]
signal BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l829_c32_d4c2]
signal BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l829_c32_ca00]
signal MUX_uxn_opcodes_h_l829_c32_ca00_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l829_c32_ca00_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l829_c32_ca00_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l829_c32_ca00_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l831_c11_3014]
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_pc_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l831_c7_38de]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_9e1f]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_b80c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l841_c11_86e2]
signal BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l841_c7_66ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l841_c7_66ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l841_c7_66ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l841_c7_66ea]
signal result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l841_c7_66ea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l841_c7_66ea]
signal result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l841_c7_66ea]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l843_c34_4e4b]
signal CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l847_c11_51ab]
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_52b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_52b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l847_c7_52b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l847_c7_52b3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d01b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346
BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1
result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1
result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- t16_MUX_uxn_opcodes_h_l810_c2_e3e1
t16_MUX_uxn_opcodes_h_l810_c2_e3e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l810_c2_e3e1_cond,
t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue,
t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse,
t16_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

-- printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57
printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57 : entity work.printf_uxn_opcodes_h_l811_c3_df57_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51
BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_left,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_right,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l815_c7_805c
result_pc_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_pc_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c
result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- t16_MUX_uxn_opcodes_h_l815_c7_805c
t16_MUX_uxn_opcodes_h_l815_c7_805c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l815_c7_805c_cond,
t16_MUX_uxn_opcodes_h_l815_c7_805c_iftrue,
t16_MUX_uxn_opcodes_h_l815_c7_805c_iffalse,
t16_MUX_uxn_opcodes_h_l815_c7_805c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6
BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_pc_MUX_uxn_opcodes_h_l818_c7_92aa
result_pc_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa
result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- t16_MUX_uxn_opcodes_h_l818_c7_92aa
t16_MUX_uxn_opcodes_h_l818_c7_92aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l818_c7_92aa_cond,
t16_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue,
t16_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse,
t16_MUX_uxn_opcodes_h_l818_c7_92aa_return_output);

-- CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f
CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_x,
CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1
BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_left,
BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_right,
BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_pc_MUX_uxn_opcodes_h_l823_c7_6a87
result_pc_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87
result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- t16_MUX_uxn_opcodes_h_l823_c7_6a87
t16_MUX_uxn_opcodes_h_l823_c7_6a87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l823_c7_6a87_cond,
t16_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue,
t16_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse,
t16_MUX_uxn_opcodes_h_l823_c7_6a87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc
BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_left,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_right,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_pc_MUX_uxn_opcodes_h_l826_c7_6dab
result_pc_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab
result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- t16_MUX_uxn_opcodes_h_l826_c7_6dab
t16_MUX_uxn_opcodes_h_l826_c7_6dab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l826_c7_6dab_cond,
t16_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue,
t16_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse,
t16_MUX_uxn_opcodes_h_l826_c7_6dab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6
BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_left,
BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_right,
BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0
BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_left,
BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_right,
BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2
BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_left,
BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_right,
BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_return_output);

-- MUX_uxn_opcodes_h_l829_c32_ca00
MUX_uxn_opcodes_h_l829_c32_ca00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l829_c32_ca00_cond,
MUX_uxn_opcodes_h_l829_c32_ca00_iftrue,
MUX_uxn_opcodes_h_l829_c32_ca00_iffalse,
MUX_uxn_opcodes_h_l829_c32_ca00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_left,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_right,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_pc_MUX_uxn_opcodes_h_l831_c7_38de
result_pc_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_pc_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de
result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l835_c7_b80c
result_pc_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c
result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2
BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_left,
BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_right,
BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea
result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea
result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea
result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_return_output);

-- result_pc_MUX_uxn_opcodes_h_l841_c7_66ea
result_pc_MUX_uxn_opcodes_h_l841_c7_66ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_cond,
result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue,
result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse,
result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_return_output);

-- CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b
CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_x,
CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab
BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_left,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_right,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3
result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 t16_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_pc_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 t16_MUX_uxn_opcodes_h_l815_c7_805c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 t16_MUX_uxn_opcodes_h_l818_c7_92aa_return_output,
 CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 t16_MUX_uxn_opcodes_h_l823_c7_6a87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 t16_MUX_uxn_opcodes_h_l826_c7_6dab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_return_output,
 MUX_uxn_opcodes_h_l829_c32_ca00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_pc_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_return_output,
 result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_return_output,
 CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_238f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_d5fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_2bb3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_2a15 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l829_c32_ca00_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l829_c32_ca00_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l829_c32_ca00_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l829_c32_ca00_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l833_c3_c1c7 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_0d52 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l839_c24_64e9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_e0f9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_a279_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_45d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l826_l841_l831_DUPLICATE_4903_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l854_l806_DUPLICATE_07ac_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l829_c32_ca00_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_e0f9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_e0f9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l829_c32_ca00_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_right := to_unsigned(8, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l833_c3_c1c7 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l833_c3_c1c7;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_0d52 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l838_c3_0d52;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_d5fd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_d5fd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_2bb3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_2bb3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_238f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_238f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_2a15 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_2a15;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_left := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l841_c11_86e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l829_c32_ffe0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_left;
     BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_return_output := BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l815_c11_cd51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_left;
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output := BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_9e1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c6_d346] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l826_c11_1afc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_left;
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output := BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l839_c24_64e9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l839_c24_64e9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_45d4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_45d4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l826_l841_l831_DUPLICATE_4903 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l826_l841_l831_DUPLICATE_4903_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l847_c11_51ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l823_c11_71e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l843_c34_4e4b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_return_output := CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c11_60b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l831_c11_3014] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_left;
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output := BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output := result.pc;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l829_c32_ffe0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_d346_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_cd51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_60b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_71e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_1afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3014_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_9e1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l841_c11_86e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_51ab_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_45d4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_45d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l839_c24_64e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l815_l810_l831_l823_l818_DUPLICATE_f9ca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l815_l841_l810_l835_l831_l826_l823_l818_DUPLICATE_7eb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l847_l815_l841_l835_l831_l826_l823_l818_DUPLICATE_2b39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l847_l815_l810_l835_l831_l826_l823_l818_DUPLICATE_e5db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l815_l810_l835_l831_l823_l818_DUPLICATE_3ea5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l847_l815_l841_l810_l835_l826_l823_l818_DUPLICATE_2af2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l847_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_e984_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l826_l841_l831_DUPLICATE_4903_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l826_l841_l831_DUPLICATE_4903_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l826_l841_l831_DUPLICATE_4903_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l815_l841_l810_l831_l826_l823_l818_DUPLICATE_823c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_52b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l841_c7_66ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l847_c7_52b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l843_c24_a279] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_a279_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l843_c34_4e4b_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l820_c3_1b2f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_return_output := CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l829_c32_d4c2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_left;
     BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_return_output := BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l810_c1_391b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l827_c3_57d6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_left;
     BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_return_output := BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_52b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l847_c7_52b3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l841_c7_66ea] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_cond;
     result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue;
     result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_return_output := result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l829_c32_ca00_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l829_c32_d4c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_57d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_a279_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_1b2f_return_output;
     VAR_printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_391b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_52b3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;
     -- MUX[uxn_opcodes_h_l829_c32_ca00] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l829_c32_ca00_cond <= VAR_MUX_uxn_opcodes_h_l829_c32_ca00_cond;
     MUX_uxn_opcodes_h_l829_c32_ca00_iftrue <= VAR_MUX_uxn_opcodes_h_l829_c32_ca00_iftrue;
     MUX_uxn_opcodes_h_l829_c32_ca00_iffalse <= VAR_MUX_uxn_opcodes_h_l829_c32_ca00_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l829_c32_ca00_return_output := MUX_uxn_opcodes_h_l829_c32_ca00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l841_c7_66ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l841_c7_66ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;

     -- t16_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     t16_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     t16_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := t16_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- printf_uxn_opcodes_h_l811_c3_df57[uxn_opcodes_h_l811_c3_df57] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l811_c3_df57_uxn_opcodes_h_l811_c3_df57_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l841_c7_66ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l841_c7_66ea] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l841_c7_66ea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue := VAR_MUX_uxn_opcodes_h_l829_c32_ca00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l841_c7_66ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_t16_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_pc_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- t16_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     t16_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     t16_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := t16_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l835_c7_b80c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_return_output := result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_b80c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- t16_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     t16_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     t16_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := t16_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_38de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l831_c7_38de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_6dab] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;

     -- t16_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     t16_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     t16_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_return_output := t16_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_6dab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- t16_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := t16_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l823_c7_6a87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l823_c7_6a87_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_pc_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_92aa] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l818_c7_92aa_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l815_c7_805c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_return_output := result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_805c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c2_e3e1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l854_l806_DUPLICATE_07ac LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l854_l806_DUPLICATE_07ac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d01b(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_e3e1_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l854_l806_DUPLICATE_07ac_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l854_l806_DUPLICATE_07ac_return_output;
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
