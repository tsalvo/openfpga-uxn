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
-- Submodules: 74
entity jsr_0CLK_c26dda62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_c26dda62;
architecture arch of jsr_0CLK_c26dda62 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l771_c6_bb06]
signal BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l771_c2_61ba]
signal t8_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c2_61ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l776_c11_a792]
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l776_c7_8096]
signal t8_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_pc_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c7_8096]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l779_c11_0cea]
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l779_c7_0643]
signal t8_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_pc_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l779_c7_0643]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l782_c32_aa05]
signal BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l782_c32_d25a]
signal BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l782_c32_cef4]
signal MUX_uxn_opcodes_h_l782_c32_cef4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l782_c32_cef4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l782_c32_cef4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l782_c32_cef4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_1bb9]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_41e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l788_c11_a846]
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_pc_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l788_c7_f786]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_1ea0]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l794_c7_db1d]
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_db1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l794_c7_db1d]
signal result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_db1d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_db1d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_db1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_db1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l796_c34_3070]
signal CONST_SR_8_uxn_opcodes_h_l796_c34_3070_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l796_c34_3070_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l798_c15_a160]
signal BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l800_c11_d251]
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l800_c7_beb4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l800_c7_beb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l800_c7_beb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l800_c7_beb4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_2401( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_sp_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06
BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_left,
BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_right,
BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output);

-- t8_MUX_uxn_opcodes_h_l771_c2_61ba
t8_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
t8_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
t8_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
t8_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_pc_MUX_uxn_opcodes_h_l771_c2_61ba
result_pc_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba
result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792
BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_left,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_right,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output);

-- t8_MUX_uxn_opcodes_h_l776_c7_8096
t8_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l776_c7_8096_cond,
t8_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
t8_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
t8_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_pc_MUX_uxn_opcodes_h_l776_c7_8096
result_pc_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_pc_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096
result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_left,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_right,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output);

-- t8_MUX_uxn_opcodes_h_l779_c7_0643
t8_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l779_c7_0643_cond,
t8_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
t8_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
t8_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_pc_MUX_uxn_opcodes_h_l779_c7_0643
result_pc_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_pc_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643
result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05
BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_left,
BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_right,
BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a
BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_left,
BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_right,
BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_return_output);

-- MUX_uxn_opcodes_h_l782_c32_cef4
MUX_uxn_opcodes_h_l782_c32_cef4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l782_c32_cef4_cond,
MUX_uxn_opcodes_h_l782_c32_cef4_iftrue,
MUX_uxn_opcodes_h_l782_c32_cef4_iffalse,
MUX_uxn_opcodes_h_l782_c32_cef4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9
BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l784_c7_41e6
result_pc_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6
result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846
BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_left,
BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_right,
BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- result_pc_MUX_uxn_opcodes_h_l788_c7_f786
result_pc_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_pc_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786
result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0
BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d
result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_cond,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l794_c7_db1d
result_pc_MUX_uxn_opcodes_h_l794_c7_db1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_cond,
result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue,
result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse,
result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l796_c34_3070
CONST_SR_8_uxn_opcodes_h_l796_c34_3070 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l796_c34_3070_x,
CONST_SR_8_uxn_opcodes_h_l796_c34_3070_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_left,
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_right,
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251
BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_left,
BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_right,
BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output,
 t8_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output,
 t8_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_pc_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output,
 t8_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_pc_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output,
 BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_return_output,
 BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_return_output,
 MUX_uxn_opcodes_h_l782_c32_cef4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 result_pc_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_return_output,
 result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_return_output,
 CONST_SR_8_uxn_opcodes_h_l796_c34_3070_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_7af4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_9678 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_cef4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_cef4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_cef4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_cef4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l786_c3_ee03 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_7d79 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_f911_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_cba6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l798_c3_e8a0 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_3070_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_3070_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c24_d509_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l798_c20_0497_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l784_l771_DUPLICATE_cfb0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l784_l771_l788_DUPLICATE_3a71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l779_l794_DUPLICATE_2d46_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l767_l807_DUPLICATE_0ddf_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l786_c3_ee03 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l786_c3_ee03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l782_c32_cef4_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_7af4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_7af4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_cba6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_cba6;
     VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_7d79 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_7d79;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l782_c32_cef4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_9678 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_9678;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_right := to_unsigned(128, 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_right := to_unsigned(5, 3);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_3070_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output := result.is_pc_updated;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l792_c24_f911] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_f911_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_1ea0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l796_c34_3070] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l796_c34_3070_x <= VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_3070_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_3070_return_output := CONST_SR_8_uxn_opcodes_h_l796_c34_3070_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l800_c11_d251] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_left;
     BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output := BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l784_l771_DUPLICATE_cfb0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l784_l771_DUPLICATE_cfb0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l779_l794_DUPLICATE_2d46 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l779_l794_DUPLICATE_2d46_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l771_c6_bb06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_left;
     BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output := BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l798_c20_0497] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l798_c20_0497_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_AND[uxn_opcodes_h_l782_c32_aa05] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_left;
     BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_return_output := BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l784_l771_l788_DUPLICATE_3a71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l784_l771_l788_DUPLICATE_3a71_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l788_c11_a846] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_left;
     BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output := BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l779_c11_0cea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_left;
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output := BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_1bb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l776_c11_a792] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_left;
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output := BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_aa05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_bb06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_a792_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_1bb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_a846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_1ea0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_d251_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l798_c20_0497_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_f911_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l784_l771_DUPLICATE_cfb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l784_l771_DUPLICATE_cfb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l784_l771_DUPLICATE_cfb0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_l788_DUPLICATE_49eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l788_DUPLICATE_9918_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l776_l800_l779_l784_l771_l788_DUPLICATE_3d34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l784_l771_l788_DUPLICATE_3a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l784_l771_l788_DUPLICATE_3a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l784_l771_l788_DUPLICATE_3a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l784_l771_l788_DUPLICATE_3a71_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l776_l800_l779_l771_l788_DUPLICATE_3cb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l776_l800_l779_l784_l771_DUPLICATE_90b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l779_l794_DUPLICATE_2d46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l779_l794_DUPLICATE_2d46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l779_l794_DUPLICATE_2d46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l776_l779_l784_l771_DUPLICATE_fec9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l800_c7_beb4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l782_c32_d25a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_left;
     BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_return_output := BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l796_c24_d509] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c24_d509_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_3070_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l800_c7_beb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;

     -- t8_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     t8_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     t8_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_return_output := t8_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l800_c7_beb4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l798_c15_a160] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_left;
     BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_return_output := BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_db1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l800_c7_beb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l782_c32_cef4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_d25a_return_output;
     VAR_result_pc_uxn_opcodes_h_l798_c3_e8a0 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_a160_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c24_d509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_beb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_t8_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue := VAR_result_pc_uxn_opcodes_h_l798_c3_e8a0;
     -- MUX[uxn_opcodes_h_l782_c32_cef4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l782_c32_cef4_cond <= VAR_MUX_uxn_opcodes_h_l782_c32_cef4_cond;
     MUX_uxn_opcodes_h_l782_c32_cef4_iftrue <= VAR_MUX_uxn_opcodes_h_l782_c32_cef4_iftrue;
     MUX_uxn_opcodes_h_l782_c32_cef4_iffalse <= VAR_MUX_uxn_opcodes_h_l782_c32_cef4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l782_c32_cef4_return_output := MUX_uxn_opcodes_h_l782_c32_cef4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l794_c7_db1d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_return_output := result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_db1d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_db1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l794_c7_db1d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_cond;
     result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_return_output := result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_db1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;

     -- t8_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     t8_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     t8_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_return_output := t8_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_db1d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue := VAR_MUX_uxn_opcodes_h_l782_c32_cef4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_db1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_t8_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_pc_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- t8_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     t8_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     t8_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := t8_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l788_c7_f786] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_f786_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_41e6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_41e6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_pc_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_0643] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_0643_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_pc_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_8096] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_8096_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l771_c2_61ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l767_l807_DUPLICATE_0ddf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l767_l807_DUPLICATE_0ddf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2401(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_61ba_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_61ba_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l767_l807_DUPLICATE_0ddf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2401_uxn_opcodes_h_l767_l807_DUPLICATE_0ddf_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
