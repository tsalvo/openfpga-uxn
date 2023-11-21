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
-- Submodules: 44
entity jcn2_0CLK_85d5529e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_85d5529e;
architecture arch of jcn2_0CLK_85d5529e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l665_c6_36cf]
signal BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c2_b21d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l665_c2_b21d]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l665_c2_b21d]
signal result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l665_c2_b21d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l665_c2_b21d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c2_b21d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c2_b21d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l665_c2_b21d]
signal n8_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l665_c2_b21d]
signal t16_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l673_c11_cd72]
signal BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l673_c7_303f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l673_c7_303f]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l673_c7_303f]
signal result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l673_c7_303f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l673_c7_303f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l673_c7_303f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l673_c7_303f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l673_c7_303f]
signal n8_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l673_c7_303f]
signal t16_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l677_c11_125f]
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l677_c7_c482]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l677_c7_c482]
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_c482]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_c482]
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_c482]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l677_c7_c482]
signal n8_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l677_c7_c482]
signal t16_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l680_c30_a7b1]
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l682_c11_16c0]
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l682_c7_cea6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l682_c7_cea6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l682_c7_cea6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l682_c7_cea6]
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l682_c7_cea6]
signal n8_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l685_c26_3ed9]
signal BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l685_c26_b40d]
signal MUX_uxn_opcodes_h_l685_c26_b40d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l685_c26_b40d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l685_c26_b40d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l685_c26_b40d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l686_c22_e840]
signal BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l686_c22_8bcc]
signal MUX_uxn_opcodes_h_l686_c22_8bcc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l686_c22_8bcc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l686_c22_8bcc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l686_c22_8bcc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_4aa6]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_8359]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_8359]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ce21( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_operation_16bit := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf
BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_left,
BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_right,
BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d
result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d
result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- n8_MUX_uxn_opcodes_h_l665_c2_b21d
n8_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
n8_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
n8_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
n8_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- t16_MUX_uxn_opcodes_h_l665_c2_b21d
t16_MUX_uxn_opcodes_h_l665_c2_b21d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l665_c2_b21d_cond,
t16_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue,
t16_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse,
t16_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72
BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_left,
BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_right,
BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f
result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_cond,
result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f
result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- n8_MUX_uxn_opcodes_h_l673_c7_303f
n8_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l673_c7_303f_cond,
n8_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
n8_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
n8_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- t16_MUX_uxn_opcodes_h_l673_c7_303f
t16_MUX_uxn_opcodes_h_l673_c7_303f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l673_c7_303f_cond,
t16_MUX_uxn_opcodes_h_l673_c7_303f_iftrue,
t16_MUX_uxn_opcodes_h_l673_c7_303f_iffalse,
t16_MUX_uxn_opcodes_h_l673_c7_303f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f
BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_left,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_right,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482
result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482
result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_cond,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output);

-- n8_MUX_uxn_opcodes_h_l677_c7_c482
n8_MUX_uxn_opcodes_h_l677_c7_c482 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l677_c7_c482_cond,
n8_MUX_uxn_opcodes_h_l677_c7_c482_iftrue,
n8_MUX_uxn_opcodes_h_l677_c7_c482_iffalse,
n8_MUX_uxn_opcodes_h_l677_c7_c482_return_output);

-- t16_MUX_uxn_opcodes_h_l677_c7_c482
t16_MUX_uxn_opcodes_h_l677_c7_c482 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l677_c7_c482_cond,
t16_MUX_uxn_opcodes_h_l677_c7_c482_iftrue,
t16_MUX_uxn_opcodes_h_l677_c7_c482_iffalse,
t16_MUX_uxn_opcodes_h_l677_c7_c482_return_output);

-- sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1
sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_ins,
sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_x,
sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_y,
sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0
BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_left,
BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_right,
BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6
result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_cond,
result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_return_output);

-- n8_MUX_uxn_opcodes_h_l682_c7_cea6
n8_MUX_uxn_opcodes_h_l682_c7_cea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l682_c7_cea6_cond,
n8_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue,
n8_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse,
n8_MUX_uxn_opcodes_h_l682_c7_cea6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9
BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_left,
BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_right,
BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_return_output);

-- MUX_uxn_opcodes_h_l685_c26_b40d
MUX_uxn_opcodes_h_l685_c26_b40d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l685_c26_b40d_cond,
MUX_uxn_opcodes_h_l685_c26_b40d_iftrue,
MUX_uxn_opcodes_h_l685_c26_b40d_iffalse,
MUX_uxn_opcodes_h_l685_c26_b40d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840
BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_left,
BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_right,
BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_return_output);

-- MUX_uxn_opcodes_h_l686_c22_8bcc
MUX_uxn_opcodes_h_l686_c22_8bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l686_c22_8bcc_cond,
MUX_uxn_opcodes_h_l686_c22_8bcc_iftrue,
MUX_uxn_opcodes_h_l686_c22_8bcc_iffalse,
MUX_uxn_opcodes_h_l686_c22_8bcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6
BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 n8_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 t16_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 n8_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 t16_MUX_uxn_opcodes_h_l673_c7_303f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output,
 n8_MUX_uxn_opcodes_h_l677_c7_c482_return_output,
 t16_MUX_uxn_opcodes_h_l677_c7_c482_return_output,
 sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_return_output,
 n8_MUX_uxn_opcodes_h_l682_c7_cea6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_return_output,
 MUX_uxn_opcodes_h_l685_c26_b40d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_return_output,
 MUX_uxn_opcodes_h_l686_c22_8bcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l670_c3_68d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l674_c3_36c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l673_c7_303f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l683_c8_d205_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l685_c26_b40d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l685_c26_b40d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l685_c26_b40d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l685_c26_b40d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l665_l682_l673_DUPLICATE_4a8f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l665_l682_l673_l677_DUPLICATE_93fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l673_l688_l677_DUPLICATE_a1c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l673_l677_DUPLICATE_3be6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l682_l673_l688_l677_DUPLICATE_aaef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l693_l660_DUPLICATE_21db_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l685_c26_b40d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l685_c26_b40d_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l674_c3_36c2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l674_c3_36c2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l670_c3_68d8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l670_c3_68d8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_left := VAR_phase;
     VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_iftrue := VAR_previous_stack_read;
     VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l682_c11_16c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l673_c7_303f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l677_c11_125f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_left;
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output := BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l665_l682_l673_DUPLICATE_4a8f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l665_l682_l673_DUPLICATE_4a8f_return_output := result.is_sp_shift;

     -- sp_relative_shift[uxn_opcodes_h_l680_c30_a7b1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_ins;
     sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_x;
     sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_return_output := sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l673_l677_DUPLICATE_3be6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l673_l677_DUPLICATE_3be6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l673_c11_cd72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_left;
     BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output := BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l683_c8_d205] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l683_c8_d205_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l665_l682_l673_l677_DUPLICATE_93fc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l665_l682_l673_l677_DUPLICATE_93fc_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l665_c6_36cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_4aa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l673_l688_l677_DUPLICATE_a1c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l673_l688_l677_DUPLICATE_a1c4_return_output := result.is_pc_updated;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l673_c7_303f_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l682_l673_l688_l677_DUPLICATE_aaef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l682_l673_l688_l677_DUPLICATE_aaef_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c6_36cf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l673_c11_cd72_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_125f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_16c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_4aa6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l683_c8_d205_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l683_c8_d205_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l683_c8_d205_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l673_l677_DUPLICATE_3be6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l673_l677_DUPLICATE_3be6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l673_l677_DUPLICATE_3be6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l665_l682_l673_l677_DUPLICATE_93fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l665_l682_l673_l677_DUPLICATE_93fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l665_l682_l673_l677_DUPLICATE_93fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l665_l682_l673_l677_DUPLICATE_93fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l682_l673_l688_l677_DUPLICATE_aaef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l682_l673_l688_l677_DUPLICATE_aaef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l682_l673_l688_l677_DUPLICATE_aaef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l682_l673_l688_l677_DUPLICATE_aaef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l673_l688_l677_DUPLICATE_a1c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l673_l688_l677_DUPLICATE_a1c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l673_l688_l677_DUPLICATE_a1c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l673_l688_l677_DUPLICATE_a1c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l665_l682_l673_DUPLICATE_4a8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l665_l682_l673_DUPLICATE_4a8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l665_l682_l673_DUPLICATE_4a8f_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a7b1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_8359] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l682_c7_cea6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;

     -- t16_MUX[uxn_opcodes_h_l677_c7_c482] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l677_c7_c482_cond <= VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_cond;
     t16_MUX_uxn_opcodes_h_l677_c7_c482_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_iftrue;
     t16_MUX_uxn_opcodes_h_l677_c7_c482_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_return_output := t16_MUX_uxn_opcodes_h_l677_c7_c482_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l685_c26_3ed9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_left;
     BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_return_output := BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_return_output;

     -- n8_MUX[uxn_opcodes_h_l682_c7_cea6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l682_c7_cea6_cond <= VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_cond;
     n8_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue;
     n8_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_return_output := n8_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_8359] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_c482] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l686_c22_e840] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_left;
     BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_return_output := BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l685_c26_b40d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c26_3ed9_return_output;
     VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_e840_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_iffalse := VAR_n8_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_8359_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_8359_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l677_c7_c482_return_output;
     -- t16_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     t16_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     t16_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_return_output := t16_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- n8_MUX[uxn_opcodes_h_l677_c7_c482] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l677_c7_c482_cond <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_cond;
     n8_MUX_uxn_opcodes_h_l677_c7_c482_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_iftrue;
     n8_MUX_uxn_opcodes_h_l677_c7_c482_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_return_output := n8_MUX_uxn_opcodes_h_l677_c7_c482_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l682_c7_cea6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- MUX[uxn_opcodes_h_l685_c26_b40d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l685_c26_b40d_cond <= VAR_MUX_uxn_opcodes_h_l685_c26_b40d_cond;
     MUX_uxn_opcodes_h_l685_c26_b40d_iftrue <= VAR_MUX_uxn_opcodes_h_l685_c26_b40d_iftrue;
     MUX_uxn_opcodes_h_l685_c26_b40d_iffalse <= VAR_MUX_uxn_opcodes_h_l685_c26_b40d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l685_c26_b40d_return_output := MUX_uxn_opcodes_h_l685_c26_b40d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l677_c7_c482] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output;

     -- MUX[uxn_opcodes_h_l686_c22_8bcc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l686_c22_8bcc_cond <= VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_cond;
     MUX_uxn_opcodes_h_l686_c22_8bcc_iftrue <= VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_iftrue;
     MUX_uxn_opcodes_h_l686_c22_8bcc_iffalse <= VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_return_output := MUX_uxn_opcodes_h_l686_c22_8bcc_return_output;

     -- Submodule level 3
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue := VAR_MUX_uxn_opcodes_h_l685_c26_b40d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue := VAR_MUX_uxn_opcodes_h_l686_c22_8bcc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l677_c7_c482_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l677_c7_c482_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- n8_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     n8_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     n8_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_return_output := n8_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l682_c7_cea6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_return_output := result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l682_c7_cea6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_c482] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- t16_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     t16_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     t16_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := t16_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_c482_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_cea6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_c482] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- n8_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     n8_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     n8_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := n8_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l677_c7_c482] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_cond;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_return_output := result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_c482_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_c482_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_return_output := result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l673_c7_303f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- Submodule level 6
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l673_c7_303f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l665_c2_b21d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l693_l660_DUPLICATE_21db LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l693_l660_DUPLICATE_21db_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ce21(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c2_b21d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c2_b21d_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l693_l660_DUPLICATE_21db_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l693_l660_DUPLICATE_21db_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
