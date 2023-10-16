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
-- Submodules: 89
entity jsr2_0CLK_6e0dc44d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_6e0dc44d;
architecture arch of jsr2_0CLK_6e0dc44d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l805_c6_86ff]
signal BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l805_c1_991d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l805_c2_760c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l805_c2_760c]
signal t16_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l806_c3_9a15[uxn_opcodes_h_l806_c3_9a15]
signal printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l810_c11_cf03]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c7_638d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l810_c7_638d]
signal t16_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l813_c11_caac]
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_482d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l813_c7_482d]
signal t16_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l815_c3_ab0d]
signal CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l818_c11_e760]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_eb04]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l818_c7_eb04]
signal t16_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l821_c11_74e0]
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l821_c7_f062]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l821_c7_f062]
signal t16_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l822_c3_db33]
signal BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l824_c30_bda9]
signal sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l826_c11_a698]
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_232e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l833_c11_76d0]
signal BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l833_c7_4cd7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l836_c31_509d]
signal CONST_SR_8_uxn_opcodes_h_l836_c31_509d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l836_c31_509d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l840_c11_a586]
signal BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l840_c7_7cd9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l840_c7_7cd9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l840_c7_7cd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l840_c7_7cd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff
BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_left,
BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_right,
BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c
result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c
result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- t16_MUX_uxn_opcodes_h_l805_c2_760c
t16_MUX_uxn_opcodes_h_l805_c2_760c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l805_c2_760c_cond,
t16_MUX_uxn_opcodes_h_l805_c2_760c_iftrue,
t16_MUX_uxn_opcodes_h_l805_c2_760c_iffalse,
t16_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

-- printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15
printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15 : entity work.printf_uxn_opcodes_h_l806_c3_9a15_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03
BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d
result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d
result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- t16_MUX_uxn_opcodes_h_l810_c7_638d
t16_MUX_uxn_opcodes_h_l810_c7_638d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l810_c7_638d_cond,
t16_MUX_uxn_opcodes_h_l810_c7_638d_iftrue,
t16_MUX_uxn_opcodes_h_l810_c7_638d_iffalse,
t16_MUX_uxn_opcodes_h_l810_c7_638d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac
BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_left,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_right,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d
result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d
result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- t16_MUX_uxn_opcodes_h_l813_c7_482d
t16_MUX_uxn_opcodes_h_l813_c7_482d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l813_c7_482d_cond,
t16_MUX_uxn_opcodes_h_l813_c7_482d_iftrue,
t16_MUX_uxn_opcodes_h_l813_c7_482d_iffalse,
t16_MUX_uxn_opcodes_h_l813_c7_482d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d
CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_x,
CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760
BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04
result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04
result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- t16_MUX_uxn_opcodes_h_l818_c7_eb04
t16_MUX_uxn_opcodes_h_l818_c7_eb04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l818_c7_eb04_cond,
t16_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue,
t16_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse,
t16_MUX_uxn_opcodes_h_l818_c7_eb04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0
BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_left,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_right,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062
result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- t16_MUX_uxn_opcodes_h_l821_c7_f062
t16_MUX_uxn_opcodes_h_l821_c7_f062 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l821_c7_f062_cond,
t16_MUX_uxn_opcodes_h_l821_c7_f062_iftrue,
t16_MUX_uxn_opcodes_h_l821_c7_f062_iffalse,
t16_MUX_uxn_opcodes_h_l821_c7_f062_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l822_c3_db33
BIN_OP_OR_uxn_opcodes_h_l822_c3_db33 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_left,
BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_right,
BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_return_output);

-- sp_relative_shift_uxn_opcodes_h_l824_c30_bda9
sp_relative_shift_uxn_opcodes_h_l824_c30_bda9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_ins,
sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_x,
sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_y,
sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698
BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_left,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_right,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e
result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e
result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0
BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_left,
BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_right,
BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l836_c31_509d
CONST_SR_8_uxn_opcodes_h_l836_c31_509d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l836_c31_509d_x,
CONST_SR_8_uxn_opcodes_h_l836_c31_509d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586
BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_left,
BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_right,
BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 t16_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 t16_MUX_uxn_opcodes_h_l810_c7_638d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 t16_MUX_uxn_opcodes_h_l813_c7_482d_return_output,
 CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 t16_MUX_uxn_opcodes_h_l818_c7_eb04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 t16_MUX_uxn_opcodes_h_l821_c7_f062_return_output,
 BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_return_output,
 sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output,
 CONST_SR_8_uxn_opcodes_h_l836_c31_509d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_f698 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l811_c3_8bb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_ffa9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_7304 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l830_c3_b46e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l828_c3_8d08 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l831_c21_d309_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_73ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_509d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_509d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_82bf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_d100_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_9d72_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l847_l801_DUPLICATE_b6d0_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l830_c3_b46e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l830_c3_b46e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l828_c3_8d08 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l828_c3_8d08;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_ffa9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_ffa9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_73ab := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_73ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l811_c3_8bb5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l811_c3_8bb5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_f698 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_f698;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_7304 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_7304;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_509d_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l805_c6_86ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l831_c21_d309] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l831_c21_d309_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l813_c11_caac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_left;
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output := BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l826_c11_a698] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_left;
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output := BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_9d72 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_9d72_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c11_cf03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l824_c30_bda9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_ins;
     sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_x;
     sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_return_output := sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c11_e760] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_d100 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_d100_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l836_c31_509d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l836_c31_509d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_509d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_509d_return_output := CONST_SR_8_uxn_opcodes_h_l836_c31_509d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l833_c11_76d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l821_c11_74e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l840_c11_a586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_left;
     BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output := BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_86ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_cf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_caac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_e760_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_74e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_a698_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_76d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_a586_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_d100_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_d100_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l831_c21_d309_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l805_l826_l818_l813_l810_DUPLICATE_2c5d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l805_l833_l826_l821_l818_l813_l810_DUPLICATE_5543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l833_l826_l821_l818_l813_l810_l840_DUPLICATE_34ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l805_l826_l821_l818_l813_l810_l840_DUPLICATE_1b5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l805_l833_l826_l818_l813_l810_DUPLICATE_feef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_7225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_l840_DUPLICATE_1dfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_9d72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_9d72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l805_l833_l821_l818_l813_l810_DUPLICATE_8211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_bda9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l840_c7_7cd9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l840_c7_7cd9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l815_c3_ab0d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_return_output := CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l822_c3_db33] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_left;
     BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_return_output := BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l836_c21_82bf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_82bf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_509d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l840_c7_7cd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l840_c7_7cd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l805_c1_991d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_db33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_82bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_ab0d_return_output;
     VAR_printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_991d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_7cd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- t16_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     t16_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     t16_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_return_output := t16_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l833_c7_4cd7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- printf_uxn_opcodes_h_l806_c3_9a15[uxn_opcodes_h_l806_c3_9a15] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l806_c3_9a15_uxn_opcodes_h_l806_c3_9a15_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4cd7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_t16_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- t16_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     t16_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     t16_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := t16_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_232e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_232e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_f062] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_return_output;

     -- t16_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     t16_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     t16_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_return_output := t16_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f062_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- t16_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     t16_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     t16_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_return_output := t16_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c7_eb04] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_eb04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- t16_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     t16_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     t16_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_return_output := t16_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_482d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_482d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l805_c2_760c_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_638d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_638d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l805_c2_760c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l847_l801_DUPLICATE_b6d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l847_l801_DUPLICATE_b6d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_760c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_760c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l847_l801_DUPLICATE_b6d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3fc8_uxn_opcodes_h_l847_l801_DUPLICATE_b6d0_return_output;
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
