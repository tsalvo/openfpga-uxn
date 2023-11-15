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
-- Submodules: 57
entity jcn2_0CLK_0226dad5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_0226dad5;
architecture arch of jcn2_0CLK_0226dad5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l670_c6_817e]
signal BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l670_c1_be9f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l670_c2_08e6]
signal n8_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l670_c2_08e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l670_c2_08e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c2_08e6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l670_c2_08e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l670_c2_08e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l670_c2_08e6]
signal result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l670_c2_08e6]
signal t16_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l671_c3_d662[uxn_opcodes_h_l671_c3_d662]
signal printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l675_c11_4b2d]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l675_c7_69c5]
signal n8_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c7_69c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_69c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_69c5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_69c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l675_c7_69c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l675_c7_69c5]
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l675_c7_69c5]
signal t16_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l678_c11_5788]
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l678_c7_b704]
signal n8_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_b704]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_b704]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_b704]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_b704]
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_b704]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l678_c7_b704]
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l678_c7_b704]
signal t16_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l680_c3_ab27]
signal CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l683_c11_49cb]
signal BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l683_c7_fb94]
signal n8_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l683_c7_fb94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l683_c7_fb94]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l683_c7_fb94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l683_c7_fb94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l683_c7_fb94]
signal result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l683_c7_fb94]
signal t16_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l684_c3_d5ff]
signal BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l686_c11_d9ba]
signal BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l686_c7_20df]
signal n8_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l686_c7_20df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l686_c7_20df]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l686_c7_20df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l686_c7_20df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l686_c7_20df]
signal result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l689_c30_1f0e]
signal sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l690_c26_48b9]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l690_c26_0c07]
signal MUX_uxn_opcodes_h_l690_c26_0c07_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l690_c26_0c07_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l690_c26_0c07_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l690_c26_0c07_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l691_c22_5648]
signal BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l691_c22_a873]
signal MUX_uxn_opcodes_h_l691_c22_a873_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l691_c22_a873_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l691_c22_a873_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l691_c22_a873_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l693_c11_155b]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_463b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_463b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_463b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4c49( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.u16_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e
BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_left,
BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_right,
BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_return_output);

-- n8_MUX_uxn_opcodes_h_l670_c2_08e6
n8_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
n8_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
n8_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
n8_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6
result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- t16_MUX_uxn_opcodes_h_l670_c2_08e6
t16_MUX_uxn_opcodes_h_l670_c2_08e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l670_c2_08e6_cond,
t16_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue,
t16_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse,
t16_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

-- printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662
printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662 : entity work.printf_uxn_opcodes_h_l671_c3_d662_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output);

-- n8_MUX_uxn_opcodes_h_l675_c7_69c5
n8_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
n8_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
n8_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
n8_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5
result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5
result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- t16_MUX_uxn_opcodes_h_l675_c7_69c5
t16_MUX_uxn_opcodes_h_l675_c7_69c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l675_c7_69c5_cond,
t16_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue,
t16_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse,
t16_MUX_uxn_opcodes_h_l675_c7_69c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788
BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_left,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_right,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output);

-- n8_MUX_uxn_opcodes_h_l678_c7_b704
n8_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l678_c7_b704_cond,
n8_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
n8_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
n8_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704
result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_cond,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- t16_MUX_uxn_opcodes_h_l678_c7_b704
t16_MUX_uxn_opcodes_h_l678_c7_b704 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l678_c7_b704_cond,
t16_MUX_uxn_opcodes_h_l678_c7_b704_iftrue,
t16_MUX_uxn_opcodes_h_l678_c7_b704_iffalse,
t16_MUX_uxn_opcodes_h_l678_c7_b704_return_output);

-- CONST_SL_8_uxn_opcodes_h_l680_c3_ab27
CONST_SL_8_uxn_opcodes_h_l680_c3_ab27 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_x,
CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb
BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_left,
BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_right,
BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output);

-- n8_MUX_uxn_opcodes_h_l683_c7_fb94
n8_MUX_uxn_opcodes_h_l683_c7_fb94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l683_c7_fb94_cond,
n8_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue,
n8_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse,
n8_MUX_uxn_opcodes_h_l683_c7_fb94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94
result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_cond,
result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_return_output);

-- t16_MUX_uxn_opcodes_h_l683_c7_fb94
t16_MUX_uxn_opcodes_h_l683_c7_fb94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l683_c7_fb94_cond,
t16_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue,
t16_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse,
t16_MUX_uxn_opcodes_h_l683_c7_fb94_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff
BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_left,
BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_right,
BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba
BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_left,
BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_right,
BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output);

-- n8_MUX_uxn_opcodes_h_l686_c7_20df
n8_MUX_uxn_opcodes_h_l686_c7_20df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l686_c7_20df_cond,
n8_MUX_uxn_opcodes_h_l686_c7_20df_iftrue,
n8_MUX_uxn_opcodes_h_l686_c7_20df_iffalse,
n8_MUX_uxn_opcodes_h_l686_c7_20df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df
result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df
result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_cond,
result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_return_output);

-- sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e
sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_ins,
sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_x,
sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_y,
sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9
BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_return_output);

-- MUX_uxn_opcodes_h_l690_c26_0c07
MUX_uxn_opcodes_h_l690_c26_0c07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l690_c26_0c07_cond,
MUX_uxn_opcodes_h_l690_c26_0c07_iftrue,
MUX_uxn_opcodes_h_l690_c26_0c07_iffalse,
MUX_uxn_opcodes_h_l690_c26_0c07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648
BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_left,
BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_right,
BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_return_output);

-- MUX_uxn_opcodes_h_l691_c22_a873
MUX_uxn_opcodes_h_l691_c22_a873 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l691_c22_a873_cond,
MUX_uxn_opcodes_h_l691_c22_a873_iftrue,
MUX_uxn_opcodes_h_l691_c22_a873_iffalse,
MUX_uxn_opcodes_h_l691_c22_a873_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b
BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_return_output,
 n8_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 t16_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output,
 n8_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 t16_MUX_uxn_opcodes_h_l675_c7_69c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output,
 n8_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 t16_MUX_uxn_opcodes_h_l678_c7_b704_return_output,
 CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output,
 n8_MUX_uxn_opcodes_h_l683_c7_fb94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_return_output,
 t16_MUX_uxn_opcodes_h_l683_c7_fb94_return_output,
 BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output,
 n8_MUX_uxn_opcodes_h_l686_c7_20df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_return_output,
 sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_return_output,
 MUX_uxn_opcodes_h_l690_c26_0c07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_return_output,
 MUX_uxn_opcodes_h_l691_c22_a873_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_e84a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_a086 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l681_c3_0795 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l678_c7_b704_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l690_c26_0c07_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l690_c26_0c07_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l690_c26_0c07_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l690_c26_0c07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l691_c22_a873_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l691_c22_a873_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l691_c22_a873_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l691_c22_a873_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l679_l684_DUPLICATE_f5b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l699_l665_DUPLICATE_5244_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l690_c26_0c07_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_e84a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_e84a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l681_c3_0795 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l681_c3_0795;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l690_c26_0c07_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l691_c22_a873_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_a086 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_a086;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_left := t16;
     VAR_MUX_uxn_opcodes_h_l691_c22_a873_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l686_c11_d9ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l670_c6_817e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_left;
     BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output := BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l678_c11_5788] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_left;
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output := BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c11_155b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c11_4b2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l678_c7_b704_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c26_48b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l691_c22_5648] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_left;
     BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_return_output := BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l679_l684_DUPLICATE_f5b3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l679_l684_DUPLICATE_f5b3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l689_c30_1f0e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_ins;
     sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_x;
     sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_return_output := sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l683_c11_49cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c6_817e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4b2d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_5788_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l683_c11_49cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c11_d9ba_return_output;
     VAR_MUX_uxn_opcodes_h_l690_c26_0c07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c26_48b9_return_output;
     VAR_MUX_uxn_opcodes_h_l691_c22_a873_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c22_5648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_155b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l679_l684_DUPLICATE_f5b3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l679_l684_DUPLICATE_f5b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_fa9d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l686_l683_l678_l675_l670_DUPLICATE_92ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l693_l686_l683_l678_l675_DUPLICATE_7f3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_ca5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l693_l683_l678_l675_l670_DUPLICATE_3492_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l678_c7_b704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l689_c30_1f0e_return_output;
     -- MUX[uxn_opcodes_h_l691_c22_a873] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l691_c22_a873_cond <= VAR_MUX_uxn_opcodes_h_l691_c22_a873_cond;
     MUX_uxn_opcodes_h_l691_c22_a873_iftrue <= VAR_MUX_uxn_opcodes_h_l691_c22_a873_iftrue;
     MUX_uxn_opcodes_h_l691_c22_a873_iffalse <= VAR_MUX_uxn_opcodes_h_l691_c22_a873_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l691_c22_a873_return_output := MUX_uxn_opcodes_h_l691_c22_a873_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c7_463b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_463b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- MUX[uxn_opcodes_h_l690_c26_0c07] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l690_c26_0c07_cond <= VAR_MUX_uxn_opcodes_h_l690_c26_0c07_cond;
     MUX_uxn_opcodes_h_l690_c26_0c07_iftrue <= VAR_MUX_uxn_opcodes_h_l690_c26_0c07_iftrue;
     MUX_uxn_opcodes_h_l690_c26_0c07_iffalse <= VAR_MUX_uxn_opcodes_h_l690_c26_0c07_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l690_c26_0c07_return_output := MUX_uxn_opcodes_h_l690_c26_0c07_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l684_c3_d5ff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_left;
     BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_return_output := BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_463b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l670_c1_be9f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l686_c7_20df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output;

     -- n8_MUX[uxn_opcodes_h_l686_c7_20df] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l686_c7_20df_cond <= VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_cond;
     n8_MUX_uxn_opcodes_h_l686_c7_20df_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_iftrue;
     n8_MUX_uxn_opcodes_h_l686_c7_20df_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_return_output := n8_MUX_uxn_opcodes_h_l686_c7_20df_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l680_c3_ab27] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_x <= VAR_CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_return_output := CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l684_c3_d5ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l680_c3_ab27_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iftrue := VAR_MUX_uxn_opcodes_h_l690_c26_0c07_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iftrue := VAR_MUX_uxn_opcodes_h_l691_c22_a873_return_output;
     VAR_printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l670_c1_be9f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse := VAR_n8_MUX_uxn_opcodes_h_l686_c7_20df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_463b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c7_463b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_463b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     -- n8_MUX[uxn_opcodes_h_l683_c7_fb94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l683_c7_fb94_cond <= VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_cond;
     n8_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue;
     n8_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_return_output := n8_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l686_c7_20df] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l686_c7_20df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l686_c7_20df] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_cond;
     result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_return_output := result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l683_c7_fb94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l686_c7_20df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_return_output;

     -- t16_MUX[uxn_opcodes_h_l683_c7_fb94] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l683_c7_fb94_cond <= VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_cond;
     t16_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue;
     t16_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_return_output := t16_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;

     -- printf_uxn_opcodes_h_l671_c3_d662[uxn_opcodes_h_l671_c3_d662] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l671_c3_d662_uxn_opcodes_h_l671_c3_d662_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_n8_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c7_20df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c7_20df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c7_20df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l686_c7_20df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_t16_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l683_c7_fb94] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_cond;
     result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_return_output := result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;

     -- t16_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     t16_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     t16_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_return_output := t16_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l683_c7_fb94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l683_c7_fb94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;

     -- n8_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     n8_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     n8_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_return_output := n8_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l683_c7_fb94] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l683_c7_fb94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_return_output := result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- n8_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     n8_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     n8_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := n8_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- t16_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     t16_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     t16_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := t16_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_b704] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_b704_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- n8_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     n8_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     n8_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := n8_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- t16_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     t16_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     t16_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := t16_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l675_c7_69c5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_return_output := result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_69c5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l670_c2_08e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l699_l665_DUPLICATE_5244 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l699_l665_DUPLICATE_5244_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4c49(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l670_c2_08e6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l670_c2_08e6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l699_l665_DUPLICATE_5244_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l699_l665_DUPLICATE_5244_return_output;
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
