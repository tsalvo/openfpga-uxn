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
-- BIN_OP_EQ[uxn_opcodes_h_l810_c6_b977]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l810_c1_18f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l810_c2_f955]
signal t16_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c2_f955]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l811_c3_12ea[uxn_opcodes_h_l811_c3_12ea]
signal printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l815_c11_7a47]
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l815_c7_5885]
signal t16_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l815_c7_5885]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l818_c11_5c2c]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal t16_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_9fd1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l820_c3_8cc7]
signal CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l823_c11_09bc]
signal BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l823_c7_924c]
signal t16_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l823_c7_924c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l826_c11_5991]
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l826_c7_63bb]
signal t16_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_63bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l827_c3_fdf5]
signal BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l829_c30_2f1d]
signal sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l831_c11_b380]
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l831_c7_7bba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_79e1]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l838_c7_5ff2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l841_c31_994e]
signal CONST_SR_8_uxn_opcodes_h_l841_c31_994e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l841_c31_994e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l845_c11_f692]
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l845_c7_9bad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l845_c7_9bad]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l845_c7_9bad]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l845_c7_9bad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_615a( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977
BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_return_output);

-- t16_MUX_uxn_opcodes_h_l810_c2_f955
t16_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l810_c2_f955_cond,
t16_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
t16_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
t16_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955
result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955
result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

-- printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea
printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea : entity work.printf_uxn_opcodes_h_l811_c3_12ea_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47
BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_left,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_right,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output);

-- t16_MUX_uxn_opcodes_h_l815_c7_5885
t16_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l815_c7_5885_cond,
t16_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
t16_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
t16_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885
result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885
result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c
BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output);

-- t16_MUX_uxn_opcodes_h_l818_c7_9fd1
t16_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
t16_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1
result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1
result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output);

-- CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7
CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_x,
CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc
BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_left,
BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_right,
BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output);

-- t16_MUX_uxn_opcodes_h_l823_c7_924c
t16_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l823_c7_924c_cond,
t16_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
t16_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
t16_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c
result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c
result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991
BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_left,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_right,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output);

-- t16_MUX_uxn_opcodes_h_l826_c7_63bb
t16_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
t16_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
t16_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
t16_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb
result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb
result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5
BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_left,
BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_right,
BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d
sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_ins,
sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_x,
sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_y,
sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380
BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_left,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_right,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba
result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba
result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1
BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2
result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l841_c31_994e
CONST_SR_8_uxn_opcodes_h_l841_c31_994e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l841_c31_994e_x,
CONST_SR_8_uxn_opcodes_h_l841_c31_994e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692
BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_left,
BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_right,
BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_return_output,
 t16_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output,
 t16_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output,
 t16_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output,
 CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output,
 t16_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output,
 t16_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_return_output,
 sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output,
 CONST_SR_8_uxn_opcodes_h_l841_c31_994e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_73af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_6a95 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_bdb8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_c2a3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_64e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l833_c3_41a2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_0218_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l840_c3_c256 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l841_c31_994e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l841_c31_994e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l841_c21_010d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_f48b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l826_DUPLICATE_4628_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l852_l806_DUPLICATE_03c4_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_64e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l835_c3_64e2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l840_c3_c256 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l840_c3_c256;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_c2a3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l824_c3_c2a3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_right := to_unsigned(7, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_6a95 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_6a95;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_73af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_73af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_right := to_unsigned(6, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_bdb8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_bdb8;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l833_c3_41a2 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l833_c3_41a2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l841_c31_994e_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l829_c30_2f1d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_ins;
     sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_x;
     sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_return_output := sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l831_c11_b380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_left;
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output := BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l823_c11_09bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l836_c21_0218] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_0218_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_79e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l841_c31_994e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l841_c31_994e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l841_c31_994e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l841_c31_994e_return_output := CONST_SR_8_uxn_opcodes_h_l841_c31_994e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l826_DUPLICATE_4628 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l826_DUPLICATE_4628_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l815_c11_7a47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_left;
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output := BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c6_b977] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l845_c11_f692] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_left;
     BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output := BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l826_c11_5991] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_left;
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output := BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c11_5c2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_f48b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_f48b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c6_b977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_7a47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_5c2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l823_c11_09bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_5991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_b380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_79e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_f692_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_f48b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l819_l827_DUPLICATE_f48b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l836_c21_0218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_DUPLICATE_082f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l810_l838_DUPLICATE_2963_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l838_DUPLICATE_0bc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l831_l826_l823_l818_l815_l845_l810_DUPLICATE_11f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l831_l823_l818_l815_l810_l838_DUPLICATE_a7e5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_3816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l826_l823_l818_l815_l845_l810_l838_DUPLICATE_fe1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l826_DUPLICATE_4628_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l826_DUPLICATE_4628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l826_l823_l818_l815_l810_l838_DUPLICATE_6e5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l829_c30_2f1d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l810_c1_18f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l841_c21_010d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l841_c21_010d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l841_c31_994e_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l827_c3_fdf5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_left;
     BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_return_output := BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l845_c7_9bad] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l845_c7_9bad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l845_c7_9bad] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l845_c7_9bad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l820_c3_8cc7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_return_output := CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l827_c3_fdf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l841_c21_010d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l820_c3_8cc7_return_output;
     VAR_printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l810_c1_18f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_9bad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     -- t16_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     t16_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     t16_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := t16_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- printf_uxn_opcodes_h_l811_c3_12ea[uxn_opcodes_h_l811_c3_12ea] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l811_c3_12ea_uxn_opcodes_h_l811_c3_12ea_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_5ff2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_5ff2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     -- t16_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     t16_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     t16_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_return_output := t16_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_7bba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_7bba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- t16_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := t16_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_63bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l826_c7_63bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_t16_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l823_c7_924c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_return_output;

     -- t16_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     t16_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     t16_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_return_output := t16_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l823_c7_924c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_t16_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- t16_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     t16_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     t16_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_return_output := t16_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c7_9fd1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_9fd1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l810_c2_f955_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l815_c7_5885] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_5885_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c2_f955] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l852_l806_DUPLICATE_03c4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l852_l806_DUPLICATE_03c4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_615a(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c2_f955_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c2_f955_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l852_l806_DUPLICATE_03c4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_615a_uxn_opcodes_h_l852_l806_DUPLICATE_03c4_return_output;
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
