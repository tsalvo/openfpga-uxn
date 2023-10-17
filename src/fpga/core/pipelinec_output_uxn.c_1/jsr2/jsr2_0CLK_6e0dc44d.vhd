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
-- BIN_OP_EQ[uxn_opcodes_h_l805_c6_a308]
signal BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l805_c1_0f0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l805_c2_0af1]
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l805_c2_0af1]
signal t16_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l806_c3_d125[uxn_opcodes_h_l806_c3_d125]
signal printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l810_c11_5002]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l810_c7_3296]
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l810_c7_3296]
signal t16_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l813_c11_32a0]
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l813_c7_f4d6]
signal t16_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l815_c3_5d66]
signal CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l818_c11_3bfd]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l818_c7_ae71]
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l818_c7_ae71]
signal t16_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l821_c11_84cf]
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l821_c7_00b8]
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l821_c7_00b8]
signal t16_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l822_c3_06c7]
signal BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l824_c30_9048]
signal sp_relative_shift_uxn_opcodes_h_l824_c30_9048_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_9048_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_9048_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_9048_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l826_c11_34de]
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l826_c7_8262]
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l833_c11_91ae]
signal BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l833_c7_4dde]
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l836_c31_0790]
signal CONST_SR_8_uxn_opcodes_h_l836_c31_0790_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l836_c31_0790_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l840_c11_53d1]
signal BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l840_c7_2a09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l840_c7_2a09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l840_c7_2a09]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l840_c7_2a09]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_fb40( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.u16_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308
BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_left,
BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_right,
BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1
result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1
result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- t16_MUX_uxn_opcodes_h_l805_c2_0af1
t16_MUX_uxn_opcodes_h_l805_c2_0af1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l805_c2_0af1_cond,
t16_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue,
t16_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse,
t16_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

-- printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125
printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125 : entity work.printf_uxn_opcodes_h_l806_c3_d125_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002
BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296
result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296
result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_cond,
result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- t16_MUX_uxn_opcodes_h_l810_c7_3296
t16_MUX_uxn_opcodes_h_l810_c7_3296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l810_c7_3296_cond,
t16_MUX_uxn_opcodes_h_l810_c7_3296_iftrue,
t16_MUX_uxn_opcodes_h_l810_c7_3296_iffalse,
t16_MUX_uxn_opcodes_h_l810_c7_3296_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0
BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_left,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_right,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6
result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6
result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- t16_MUX_uxn_opcodes_h_l813_c7_f4d6
t16_MUX_uxn_opcodes_h_l813_c7_f4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l813_c7_f4d6_cond,
t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue,
t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse,
t16_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l815_c3_5d66
CONST_SL_8_uxn_opcodes_h_l815_c3_5d66 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_x,
CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd
BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71
result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71
result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- t16_MUX_uxn_opcodes_h_l818_c7_ae71
t16_MUX_uxn_opcodes_h_l818_c7_ae71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l818_c7_ae71_cond,
t16_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue,
t16_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse,
t16_MUX_uxn_opcodes_h_l818_c7_ae71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf
BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_left,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_right,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8
result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8
result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- t16_MUX_uxn_opcodes_h_l821_c7_00b8
t16_MUX_uxn_opcodes_h_l821_c7_00b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l821_c7_00b8_cond,
t16_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue,
t16_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse,
t16_MUX_uxn_opcodes_h_l821_c7_00b8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7
BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_left,
BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_right,
BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l824_c30_9048
sp_relative_shift_uxn_opcodes_h_l824_c30_9048 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l824_c30_9048_ins,
sp_relative_shift_uxn_opcodes_h_l824_c30_9048_x,
sp_relative_shift_uxn_opcodes_h_l824_c30_9048_y,
sp_relative_shift_uxn_opcodes_h_l824_c30_9048_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de
BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_left,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_right,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262
result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262
result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_cond,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae
BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_left,
BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_right,
BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond,
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output);

-- CONST_SR_8_uxn_opcodes_h_l836_c31_0790
CONST_SR_8_uxn_opcodes_h_l836_c31_0790 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l836_c31_0790_x,
CONST_SR_8_uxn_opcodes_h_l836_c31_0790_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1
BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_left,
BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_right,
BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 t16_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 t16_MUX_uxn_opcodes_h_l810_c7_3296_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 t16_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output,
 CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 t16_MUX_uxn_opcodes_h_l818_c7_ae71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 t16_MUX_uxn_opcodes_h_l821_c7_00b8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_return_output,
 sp_relative_shift_uxn_opcodes_h_l824_c30_9048_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output,
 CONST_SR_8_uxn_opcodes_h_l836_c31_0790_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_2826 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l811_c3_990f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_6f70 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_fb1b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l830_c3_8998 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l828_c3_f1da : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l831_c21_4165_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_ce7b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_0790_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_0790_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_818a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_5be7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_0687_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l847_l801_DUPLICATE_74da_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l828_c3_f1da := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l828_c3_f1da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l811_c3_990f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l811_c3_990f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_ce7b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_ce7b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_2826 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l807_c3_2826;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_6f70 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_6f70;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_fb1b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l819_c3_fb1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l830_c3_8998 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l830_c3_8998;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_0790_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l818_c11_3bfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c11_5002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l833_c11_91ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output := result.u16_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l831_c21_4165] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l831_c21_4165_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_5be7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_5be7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l824_c30_9048] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l824_c30_9048_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_ins;
     sp_relative_shift_uxn_opcodes_h_l824_c30_9048_x <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_x;
     sp_relative_shift_uxn_opcodes_h_l824_c30_9048_y <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_return_output := sp_relative_shift_uxn_opcodes_h_l824_c30_9048_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_0687 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_0687_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l813_c11_32a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l836_c31_0790] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l836_c31_0790_x <= VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_0790_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_0790_return_output := CONST_SR_8_uxn_opcodes_h_l836_c31_0790_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l821_c11_84cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l805_c6_a308] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_left;
     BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output := BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l826_c11_34de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_left;
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output := BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l840_c11_53d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c6_a308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_5002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_32a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_3bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_84cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_34de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l833_c11_91ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c11_53d1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_5be7_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l822_l814_DUPLICATE_5be7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l831_c21_4165_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l810_l805_l826_l818_l813_DUPLICATE_2802_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l810_l805_l833_l826_l821_l818_l813_DUPLICATE_886a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l810_l840_l833_l826_l821_l818_l813_DUPLICATE_1e60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l810_l840_l805_l826_l821_l818_l813_DUPLICATE_d12c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l810_l805_l833_l826_l818_l813_DUPLICATE_122d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_4f0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l810_l840_l805_l833_l821_l818_l813_DUPLICATE_f331_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_0687_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l833_l821_DUPLICATE_0687_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l810_l805_l833_l821_l818_l813_DUPLICATE_bfc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_9048_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l840_c7_2a09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l815_c3_5d66] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_x <= VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_return_output := CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l840_c7_2a09] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l840_c7_2a09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l840_c7_2a09] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l836_c21_818a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_818a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l836_c31_0790_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l805_c1_0f0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l822_c3_06c7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_left;
     BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_return_output := BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l822_c3_06c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_818a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l815_c3_5d66_return_output;
     VAR_printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l805_c1_0f0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c7_2a09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- t16_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     t16_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     t16_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := t16_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- printf_uxn_opcodes_h_l806_c3_d125[uxn_opcodes_h_l806_c3_d125] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l806_c3_d125_uxn_opcodes_h_l806_c3_d125_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l833_c7_4dde] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_cond;
     result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output := result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l833_c7_4dde_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_t16_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- t16_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     t16_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     t16_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := t16_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_8262] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_8262_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- t16_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := t16_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_00b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_00b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_t16_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c7_ae71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- t16_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     t16_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     t16_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_return_output := t16_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_ae71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- t16_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     t16_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     t16_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := t16_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_f4d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l813_c7_f4d6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_3296] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c7_3296_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l805_c2_0af1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l847_l801_DUPLICATE_74da LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l847_l801_DUPLICATE_74da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fb40(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c2_0af1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l805_c2_0af1_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l847_l801_DUPLICATE_74da_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l847_l801_DUPLICATE_74da_return_output;
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
