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
-- Submodules: 77
entity jcn2_0CLK_c26dda62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_c26dda62;
architecture arch of jcn2_0CLK_c26dda62 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l728_c6_bb6b]
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l728_c1_bd3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l728_c2_1a54]
signal n8_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l728_c2_1a54]
signal t16_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l728_c2_1a54]
signal result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c2_1a54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c2_1a54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c2_1a54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c2_1a54]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l728_c2_1a54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l729_c3_cacc[uxn_opcodes_h_l729_c3_cacc]
signal printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l733_c11_2240]
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l733_c7_bd30]
signal n8_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l733_c7_bd30]
signal t16_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l733_c7_bd30]
signal result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l733_c7_bd30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l733_c7_bd30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l733_c7_bd30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l733_c7_bd30]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l733_c7_bd30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_666f]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal n8_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal t16_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_b3a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l738_c3_be3e]
signal CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l741_c11_d687]
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l741_c7_bae9]
signal n8_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l741_c7_bae9]
signal t16_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l741_c7_bae9]
signal result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_bae9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_bae9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_bae9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_bae9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_bae9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l744_c11_f0f4]
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal n8_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal t16_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_2b7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l745_c3_17a1]
signal BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l748_c11_4ea4]
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l748_c7_64a1]
signal n8_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l748_c7_64a1]
signal result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_64a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l748_c7_64a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l748_c7_64a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_64a1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_64a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l751_c11_d1fd]
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l751_c7_9284]
signal n8_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l751_c7_9284]
signal result_pc_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_9284]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l751_c7_9284]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_9284]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_9284]
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l754_c32_eaee]
signal BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l754_c32_51f9]
signal BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l754_c32_974a]
signal MUX_uxn_opcodes_h_l754_c32_974a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l754_c32_974a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l754_c32_974a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l754_c32_974a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l755_c26_7979]
signal BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l755_c26_f4ed]
signal MUX_uxn_opcodes_h_l755_c26_f4ed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l755_c26_f4ed_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l755_c26_f4ed_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l755_c26_f4ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l756_c15_6d6d]
signal BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l756_c15_5816]
signal MUX_uxn_opcodes_h_l756_c15_5816_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l756_c15_5816_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l756_c15_5816_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l756_c15_5816_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_914d]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_80f8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_80f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_80f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f87d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b
BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_left,
BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_right,
BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_return_output);

-- n8_MUX_uxn_opcodes_h_l728_c2_1a54
n8_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
n8_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
n8_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
n8_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- t16_MUX_uxn_opcodes_h_l728_c2_1a54
t16_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
t16_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
t16_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
t16_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- result_pc_MUX_uxn_opcodes_h_l728_c2_1a54
result_pc_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

-- printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc
printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc : entity work.printf_uxn_opcodes_h_l729_c3_cacc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240
BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_left,
BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_right,
BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output);

-- n8_MUX_uxn_opcodes_h_l733_c7_bd30
n8_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
n8_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
n8_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
n8_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- t16_MUX_uxn_opcodes_h_l733_c7_bd30
t16_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
t16_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
t16_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
t16_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- result_pc_MUX_uxn_opcodes_h_l733_c7_bd30
result_pc_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f
BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output);

-- n8_MUX_uxn_opcodes_h_l736_c7_b3a5
n8_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
n8_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- t16_MUX_uxn_opcodes_h_l736_c7_b3a5
t16_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
t16_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5
result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l738_c3_be3e
CONST_SL_8_uxn_opcodes_h_l738_c3_be3e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_x,
CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687
BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_left,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_right,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output);

-- n8_MUX_uxn_opcodes_h_l741_c7_bae9
n8_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
n8_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
n8_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
n8_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- t16_MUX_uxn_opcodes_h_l741_c7_bae9
t16_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
t16_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
t16_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
t16_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l741_c7_bae9
result_pc_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4
BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_left,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_right,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output);

-- n8_MUX_uxn_opcodes_h_l744_c7_2b7f
n8_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
n8_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- t16_MUX_uxn_opcodes_h_l744_c7_2b7f
t16_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
t16_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f
result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1
BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_left,
BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_right,
BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_left,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_right,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output);

-- n8_MUX_uxn_opcodes_h_l748_c7_64a1
n8_MUX_uxn_opcodes_h_l748_c7_64a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l748_c7_64a1_cond,
n8_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue,
n8_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse,
n8_MUX_uxn_opcodes_h_l748_c7_64a1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l748_c7_64a1
result_pc_MUX_uxn_opcodes_h_l748_c7_64a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_cond,
result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue,
result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse,
result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd
BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_left,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_right,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output);

-- n8_MUX_uxn_opcodes_h_l751_c7_9284
n8_MUX_uxn_opcodes_h_l751_c7_9284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l751_c7_9284_cond,
n8_MUX_uxn_opcodes_h_l751_c7_9284_iftrue,
n8_MUX_uxn_opcodes_h_l751_c7_9284_iffalse,
n8_MUX_uxn_opcodes_h_l751_c7_9284_return_output);

-- result_pc_MUX_uxn_opcodes_h_l751_c7_9284
result_pc_MUX_uxn_opcodes_h_l751_c7_9284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l751_c7_9284_cond,
result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iftrue,
result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iffalse,
result_pc_MUX_uxn_opcodes_h_l751_c7_9284_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee
BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_left,
BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_right,
BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9
BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_left,
BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_right,
BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_return_output);

-- MUX_uxn_opcodes_h_l754_c32_974a
MUX_uxn_opcodes_h_l754_c32_974a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l754_c32_974a_cond,
MUX_uxn_opcodes_h_l754_c32_974a_iftrue,
MUX_uxn_opcodes_h_l754_c32_974a_iffalse,
MUX_uxn_opcodes_h_l754_c32_974a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979
BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_left,
BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_right,
BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_return_output);

-- MUX_uxn_opcodes_h_l755_c26_f4ed
MUX_uxn_opcodes_h_l755_c26_f4ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l755_c26_f4ed_cond,
MUX_uxn_opcodes_h_l755_c26_f4ed_iftrue,
MUX_uxn_opcodes_h_l755_c26_f4ed_iffalse,
MUX_uxn_opcodes_h_l755_c26_f4ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d
BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_left,
BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_right,
BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_return_output);

-- MUX_uxn_opcodes_h_l756_c15_5816
MUX_uxn_opcodes_h_l756_c15_5816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l756_c15_5816_cond,
MUX_uxn_opcodes_h_l756_c15_5816_iftrue,
MUX_uxn_opcodes_h_l756_c15_5816_iffalse,
MUX_uxn_opcodes_h_l756_c15_5816_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d
BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_return_output,
 n8_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 t16_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output,
 n8_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 t16_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output,
 n8_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 t16_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output,
 CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output,
 n8_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 t16_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output,
 n8_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 t16_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output,
 n8_MUX_uxn_opcodes_h_l748_c7_64a1_return_output,
 result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output,
 n8_MUX_uxn_opcodes_h_l751_c7_9284_return_output,
 result_pc_MUX_uxn_opcodes_h_l751_c7_9284_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_return_output,
 BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_return_output,
 BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_return_output,
 MUX_uxn_opcodes_h_l754_c32_974a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_return_output,
 MUX_uxn_opcodes_h_l755_c26_f4ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_return_output,
 MUX_uxn_opcodes_h_l756_c15_5816_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_a01a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_d204 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_0f49 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_815c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l746_c3_8218 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_61a7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l748_c7_64a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_974a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_974a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_974a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_974a_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_5816_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_5816_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_5816_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_5816_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l745_DUPLICATE_6f2d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l764_l723_DUPLICATE_98bd_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l754_c32_974a_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l754_c32_974a_iffalse := resize(to_signed(-3, 3), 8);
     VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_815c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_815c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_61a7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_61a7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_a01a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_a01a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l746_c3_8218 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l746_c3_8218;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_0f49 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_0f49;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_d204 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_d204;
     VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_iffalse := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l756_c15_5816_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_left := t16;
     VAR_MUX_uxn_opcodes_h_l756_c15_5816_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := t16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output := result.pc;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l748_c7_64a1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l728_c6_bb6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_666f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l748_c11_4ea4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_left;
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output := BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l754_c32_eaee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_left;
     BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_return_output := BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l741_c11_d687] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_left;
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output := BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l751_c11_d1fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l744_c11_f0f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l755_c26_7979] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_left;
     BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_return_output := BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l756_c15_6d6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l733_c11_2240] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_left;
     BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output := BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_914d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l745_DUPLICATE_6f2d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l745_DUPLICATE_6f2d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_eaee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_bb6b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_2240_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_666f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_d687_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_f0f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_4ea4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_d1fd_return_output;
     VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_7979_return_output;
     VAR_MUX_uxn_opcodes_h_l756_c15_5816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_6d6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_914d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l745_DUPLICATE_6f2d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l745_DUPLICATE_6f2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_6eab_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l751_DUPLICATE_4c3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l748_l741_l736_l733_l758_l751_DUPLICATE_e3d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_a46b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l748_l741_l736_l728_l733_l758_DUPLICATE_7de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l748_c7_64a1_return_output;
     -- n8_MUX[uxn_opcodes_h_l751_c7_9284] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l751_c7_9284_cond <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_cond;
     n8_MUX_uxn_opcodes_h_l751_c7_9284_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_iftrue;
     n8_MUX_uxn_opcodes_h_l751_c7_9284_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_return_output := n8_MUX_uxn_opcodes_h_l751_c7_9284_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_80f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l728_c1_bd3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l738_c3_be3e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_return_output := CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_return_output;

     -- MUX[uxn_opcodes_h_l755_c26_f4ed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l755_c26_f4ed_cond <= VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_cond;
     MUX_uxn_opcodes_h_l755_c26_f4ed_iftrue <= VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_iftrue;
     MUX_uxn_opcodes_h_l755_c26_f4ed_iffalse <= VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_return_output := MUX_uxn_opcodes_h_l755_c26_f4ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_80f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l745_c3_17a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_left;
     BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_return_output := BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l754_c32_51f9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_left;
     BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_return_output := BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_return_output;

     -- MUX[uxn_opcodes_h_l756_c15_5816] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l756_c15_5816_cond <= VAR_MUX_uxn_opcodes_h_l756_c15_5816_cond;
     MUX_uxn_opcodes_h_l756_c15_5816_iftrue <= VAR_MUX_uxn_opcodes_h_l756_c15_5816_iftrue;
     MUX_uxn_opcodes_h_l756_c15_5816_iffalse <= VAR_MUX_uxn_opcodes_h_l756_c15_5816_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l756_c15_5816_return_output := MUX_uxn_opcodes_h_l756_c15_5816_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_80f8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l754_c32_974a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_51f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_17a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_be3e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iftrue := VAR_MUX_uxn_opcodes_h_l755_c26_f4ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iftrue := VAR_MUX_uxn_opcodes_h_l756_c15_5816_return_output;
     VAR_printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_bd3c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l751_c7_9284_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_80f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_80f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_80f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;
     -- t16_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := t16_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_9284] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_return_output;

     -- MUX[uxn_opcodes_h_l754_c32_974a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l754_c32_974a_cond <= VAR_MUX_uxn_opcodes_h_l754_c32_974a_cond;
     MUX_uxn_opcodes_h_l754_c32_974a_iftrue <= VAR_MUX_uxn_opcodes_h_l754_c32_974a_iftrue;
     MUX_uxn_opcodes_h_l754_c32_974a_iffalse <= VAR_MUX_uxn_opcodes_h_l754_c32_974a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l754_c32_974a_return_output := MUX_uxn_opcodes_h_l754_c32_974a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l751_c7_9284] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l751_c7_9284_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_cond;
     result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iftrue;
     result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_return_output := result_pc_MUX_uxn_opcodes_h_l751_c7_9284_return_output;

     -- n8_MUX[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l748_c7_64a1_cond <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_cond;
     n8_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue;
     n8_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_return_output := n8_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_9284] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output;

     -- printf_uxn_opcodes_h_l729_c3_cacc[uxn_opcodes_h_l729_c3_cacc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l729_c3_cacc_uxn_opcodes_h_l729_c3_cacc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_9284] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue := VAR_MUX_uxn_opcodes_h_l754_c32_974a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_9284_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_9284_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_9284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     -- n8_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := n8_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_cond;
     result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_return_output := result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l751_c7_9284] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output;

     -- t16_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     t16_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     t16_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := t16_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_9284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     -- n8_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     n8_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     n8_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := n8_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l748_c7_64a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- t16_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := t16_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_64a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- t16_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     t16_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     t16_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := t16_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- n8_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := n8_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_2b7f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_n8_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2b7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_t16_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     -- t16_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     t16_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     t16_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := t16_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- n8_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     n8_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     n8_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := n8_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_bae9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_n8_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_bae9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_b3a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- n8_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     n8_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     n8_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := n8_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_b3a5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l733_c7_bd30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_bd30_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c2_1a54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l764_l723_DUPLICATE_98bd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l764_l723_DUPLICATE_98bd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f87d(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_1a54_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_1a54_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l764_l723_DUPLICATE_98bd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l764_l723_DUPLICATE_98bd_return_output;
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
