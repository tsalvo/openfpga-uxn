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
-- Submodules: 84
entity jcn2_0CLK_77d0ca3d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_77d0ca3d;
architecture arch of jcn2_0CLK_77d0ca3d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l750_c6_fadb]
signal BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l750_c1_7e2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l750_c2_65ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l750_c2_65ab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l750_c2_65ab]
signal result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l750_c2_65ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l750_c2_65ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l750_c2_65ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l750_c2_65ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l750_c2_65ab]
signal n8_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l750_c2_65ab]
signal t16_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l751_c3_5010[uxn_opcodes_h_l751_c3_5010]
signal printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l756_c11_b22a]
signal BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l756_c7_00fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l756_c7_00fb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l756_c7_00fb]
signal result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l756_c7_00fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l756_c7_00fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l756_c7_00fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l756_c7_00fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l756_c7_00fb]
signal n8_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l756_c7_00fb]
signal t16_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l759_c11_a40b]
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_06b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l759_c7_06b4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l759_c7_06b4]
signal result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_06b4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_06b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_06b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_06b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l759_c7_06b4]
signal n8_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l759_c7_06b4]
signal t16_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l761_c3_69bc]
signal CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l764_c11_463f]
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal n8_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l764_c7_a3a6]
signal t16_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l767_c11_ea42]
signal BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c7_3180]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l767_c7_3180]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l767_c7_3180]
signal result_pc_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l767_c7_3180]
signal result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l767_c7_3180]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c7_3180]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l767_c7_3180]
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l767_c7_3180]
signal n8_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l767_c7_3180]
signal t16_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l768_c3_3ab7]
signal BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l771_c11_5f01]
signal BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c7_44d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c7_44d4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l771_c7_44d4]
signal result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l771_c7_44d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c7_44d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c7_44d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l771_c7_44d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l771_c7_44d4]
signal n8_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l774_c11_459d]
signal BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l774_c7_76c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l774_c7_76c5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l774_c7_76c5]
signal result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c7_76c5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c7_76c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l774_c7_76c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l774_c7_76c5]
signal n8_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l778_c32_0547]
signal BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l778_c32_95b1]
signal BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l778_c32_40e4]
signal MUX_uxn_opcodes_h_l778_c32_40e4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l778_c32_40e4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l778_c32_40e4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l778_c32_40e4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l779_c26_694c]
signal BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l779_c26_2a0f]
signal MUX_uxn_opcodes_h_l779_c26_2a0f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l779_c26_2a0f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l779_c26_2a0f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l779_c26_2a0f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l780_c15_46bf]
signal BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l780_c15_5e05]
signal MUX_uxn_opcodes_h_l780_c15_5e05_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l780_c15_5e05_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l780_c15_5e05_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l780_c15_5e05_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l782_c11_9421]
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c7_79d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l782_c7_79d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l782_c7_79d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cc54( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb
BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_left,
BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_right,
BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- result_pc_MUX_uxn_opcodes_h_l750_c2_65ab
result_pc_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab
result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab
result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- n8_MUX_uxn_opcodes_h_l750_c2_65ab
n8_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
n8_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
n8_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
n8_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- t16_MUX_uxn_opcodes_h_l750_c2_65ab
t16_MUX_uxn_opcodes_h_l750_c2_65ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l750_c2_65ab_cond,
t16_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue,
t16_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse,
t16_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

-- printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010
printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010 : entity work.printf_uxn_opcodes_h_l751_c3_5010_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a
BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_left,
BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_right,
BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l756_c7_00fb
result_pc_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb
result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- n8_MUX_uxn_opcodes_h_l756_c7_00fb
n8_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
n8_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
n8_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
n8_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- t16_MUX_uxn_opcodes_h_l756_c7_00fb
t16_MUX_uxn_opcodes_h_l756_c7_00fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l756_c7_00fb_cond,
t16_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue,
t16_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse,
t16_MUX_uxn_opcodes_h_l756_c7_00fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b
BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_left,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_right,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4
result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l759_c7_06b4
result_pc_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- n8_MUX_uxn_opcodes_h_l759_c7_06b4
n8_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
n8_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
n8_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
n8_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- t16_MUX_uxn_opcodes_h_l759_c7_06b4
t16_MUX_uxn_opcodes_h_l759_c7_06b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l759_c7_06b4_cond,
t16_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue,
t16_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse,
t16_MUX_uxn_opcodes_h_l759_c7_06b4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l761_c3_69bc
CONST_SL_8_uxn_opcodes_h_l761_c3_69bc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_x,
CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f
BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_left,
BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_right,
BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6
result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6
result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- n8_MUX_uxn_opcodes_h_l764_c7_a3a6
n8_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
n8_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- t16_MUX_uxn_opcodes_h_l764_c7_a3a6
t16_MUX_uxn_opcodes_h_l764_c7_a3a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l764_c7_a3a6_cond,
t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue,
t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse,
t16_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42
BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_left,
BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_right,
BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- result_pc_MUX_uxn_opcodes_h_l767_c7_3180
result_pc_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l767_c7_3180_cond,
result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
result_pc_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180
result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- n8_MUX_uxn_opcodes_h_l767_c7_3180
n8_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l767_c7_3180_cond,
n8_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
n8_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
n8_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- t16_MUX_uxn_opcodes_h_l767_c7_3180
t16_MUX_uxn_opcodes_h_l767_c7_3180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l767_c7_3180_cond,
t16_MUX_uxn_opcodes_h_l767_c7_3180_iftrue,
t16_MUX_uxn_opcodes_h_l767_c7_3180_iffalse,
t16_MUX_uxn_opcodes_h_l767_c7_3180_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7
BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_left,
BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_right,
BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01
BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_left,
BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_right,
BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l771_c7_44d4
result_pc_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- n8_MUX_uxn_opcodes_h_l771_c7_44d4
n8_MUX_uxn_opcodes_h_l771_c7_44d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l771_c7_44d4_cond,
n8_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue,
n8_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse,
n8_MUX_uxn_opcodes_h_l771_c7_44d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d
BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_left,
BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_right,
BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5
result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l774_c7_76c5
result_pc_MUX_uxn_opcodes_h_l774_c7_76c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_cond,
result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue,
result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse,
result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_return_output);

-- n8_MUX_uxn_opcodes_h_l774_c7_76c5
n8_MUX_uxn_opcodes_h_l774_c7_76c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l774_c7_76c5_cond,
n8_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue,
n8_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse,
n8_MUX_uxn_opcodes_h_l774_c7_76c5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l778_c32_0547
BIN_OP_AND_uxn_opcodes_h_l778_c32_0547 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_left,
BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_right,
BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1
BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_left,
BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_right,
BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_return_output);

-- MUX_uxn_opcodes_h_l778_c32_40e4
MUX_uxn_opcodes_h_l778_c32_40e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l778_c32_40e4_cond,
MUX_uxn_opcodes_h_l778_c32_40e4_iftrue,
MUX_uxn_opcodes_h_l778_c32_40e4_iffalse,
MUX_uxn_opcodes_h_l778_c32_40e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c
BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_left,
BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_right,
BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_return_output);

-- MUX_uxn_opcodes_h_l779_c26_2a0f
MUX_uxn_opcodes_h_l779_c26_2a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l779_c26_2a0f_cond,
MUX_uxn_opcodes_h_l779_c26_2a0f_iftrue,
MUX_uxn_opcodes_h_l779_c26_2a0f_iffalse,
MUX_uxn_opcodes_h_l779_c26_2a0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf
BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_left,
BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_right,
BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_return_output);

-- MUX_uxn_opcodes_h_l780_c15_5e05
MUX_uxn_opcodes_h_l780_c15_5e05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l780_c15_5e05_cond,
MUX_uxn_opcodes_h_l780_c15_5e05_iftrue,
MUX_uxn_opcodes_h_l780_c15_5e05_iffalse,
MUX_uxn_opcodes_h_l780_c15_5e05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421
BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_left,
BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_right,
BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 n8_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 t16_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 n8_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 t16_MUX_uxn_opcodes_h_l756_c7_00fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 n8_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 t16_MUX_uxn_opcodes_h_l759_c7_06b4_return_output,
 CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 n8_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 t16_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 result_pc_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 n8_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 t16_MUX_uxn_opcodes_h_l767_c7_3180_return_output,
 BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 n8_MUX_uxn_opcodes_h_l771_c7_44d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_return_output,
 result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_return_output,
 n8_MUX_uxn_opcodes_h_l774_c7_76c5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_return_output,
 BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_return_output,
 MUX_uxn_opcodes_h_l778_c32_40e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_return_output,
 MUX_uxn_opcodes_h_l779_c26_2a0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_return_output,
 MUX_uxn_opcodes_h_l780_c15_5e05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_2b0c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_2e67 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l762_c3_34c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l765_c3_58b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_a1a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l772_c3_3093 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l771_c7_44d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_40e4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_40e4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_40e4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_40e4_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l780_c15_5e05_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l780_c15_5e05_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l780_c15_5e05_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l780_c15_5e05_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l760_l768_DUPLICATE_3538_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l788_l745_DUPLICATE_8e96_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l778_c32_40e4_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_2e67 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l757_c3_2e67;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l772_c3_3093 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l772_c3_3093;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l762_c3_34c0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l762_c3_34c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_2b0c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l753_c3_2b0c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l778_c32_40e4_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_a1a0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_a1a0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l765_c3_58b3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l765_c3_58b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l780_c15_5e05_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_left := t16;
     VAR_MUX_uxn_opcodes_h_l780_c15_5e05_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l750_c6_fadb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_left;
     BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output := BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l764_c11_463f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_left;
     BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output := BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l782_c11_9421] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_left;
     BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output := BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l771_c11_5f01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_left;
     BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output := BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l771_c7_44d4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l774_c11_459d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_left;
     BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output := BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output := result.pc;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l760_l768_DUPLICATE_3538 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l760_l768_DUPLICATE_3538_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l780_c15_46bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l759_c11_a40b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_left;
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output := BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l778_c32_0547] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_left;
     BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_return_output := BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l767_c11_ea42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_left;
     BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output := BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l779_c26_694c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_left;
     BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_return_output := BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l756_c11_b22a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_left;
     BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output := BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_0547_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c6_fadb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c11_b22a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_a40b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c11_463f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_ea42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_5f01_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c11_459d_return_output;
     VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c26_694c_return_output;
     VAR_MUX_uxn_opcodes_h_l780_c15_5e05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c15_46bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_9421_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l760_l768_DUPLICATE_3538_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l760_l768_DUPLICATE_3538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_bdcc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l759_l756_l750_l774_l771_l767_l764_DUPLICATE_c442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l759_l756_l782_l774_l771_l767_l764_DUPLICATE_ae81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_1bf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l759_l756_l782_l750_l771_l767_l764_DUPLICATE_11f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l759_l756_l774_l771_l767_l764_DUPLICATE_6462_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l771_c7_44d4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l774_c7_76c5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l750_c1_7e2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l778_c32_95b1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_left;
     BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_return_output := BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l761_c3_69bc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_return_output := CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_return_output;

     -- n8_MUX[uxn_opcodes_h_l774_c7_76c5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l774_c7_76c5_cond <= VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_cond;
     n8_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue;
     n8_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_return_output := n8_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;

     -- MUX[uxn_opcodes_h_l779_c26_2a0f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l779_c26_2a0f_cond <= VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_cond;
     MUX_uxn_opcodes_h_l779_c26_2a0f_iftrue <= VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_iftrue;
     MUX_uxn_opcodes_h_l779_c26_2a0f_iffalse <= VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_return_output := MUX_uxn_opcodes_h_l779_c26_2a0f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c7_79d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l782_c7_79d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l768_c3_3ab7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_left;
     BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_return_output := BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l782_c7_79d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_return_output;

     -- MUX[uxn_opcodes_h_l780_c15_5e05] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l780_c15_5e05_cond <= VAR_MUX_uxn_opcodes_h_l780_c15_5e05_cond;
     MUX_uxn_opcodes_h_l780_c15_5e05_iftrue <= VAR_MUX_uxn_opcodes_h_l780_c15_5e05_iftrue;
     MUX_uxn_opcodes_h_l780_c15_5e05_iffalse <= VAR_MUX_uxn_opcodes_h_l780_c15_5e05_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l780_c15_5e05_return_output := MUX_uxn_opcodes_h_l780_c15_5e05_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l778_c32_40e4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_95b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l768_c3_3ab7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l761_c3_69bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue := VAR_MUX_uxn_opcodes_h_l779_c26_2a0f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue := VAR_MUX_uxn_opcodes_h_l780_c15_5e05_return_output;
     VAR_printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l750_c1_7e2d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_79d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c7_79d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_79d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l774_c7_76c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l774_c7_76c5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_cond;
     result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_return_output := result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l774_c7_76c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;

     -- n8_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     n8_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     n8_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := n8_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- MUX[uxn_opcodes_h_l778_c32_40e4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l778_c32_40e4_cond <= VAR_MUX_uxn_opcodes_h_l778_c32_40e4_cond;
     MUX_uxn_opcodes_h_l778_c32_40e4_iftrue <= VAR_MUX_uxn_opcodes_h_l778_c32_40e4_iftrue;
     MUX_uxn_opcodes_h_l778_c32_40e4_iffalse <= VAR_MUX_uxn_opcodes_h_l778_c32_40e4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l778_c32_40e4_return_output := MUX_uxn_opcodes_h_l778_c32_40e4_return_output;

     -- printf_uxn_opcodes_h_l751_c3_5010[uxn_opcodes_h_l751_c3_5010] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l751_c3_5010_uxn_opcodes_h_l751_c3_5010_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c7_76c5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;

     -- t16_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     t16_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     t16_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_return_output := t16_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue := VAR_MUX_uxn_opcodes_h_l778_c32_40e4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_n8_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c7_76c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- t16_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := t16_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- n8_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     n8_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     n8_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_return_output := n8_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c7_76c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_return_output := result_pc_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c7_44d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;

     -- n8_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := n8_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     t16_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     t16_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := t16_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_44d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     n8_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     n8_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := n8_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- t16_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     t16_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     t16_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := t16_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l767_c7_3180] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c7_3180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- t16_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     t16_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     t16_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := t16_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l764_c7_a3a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     n8_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     n8_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := n8_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_n8_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c7_a3a6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l759_c7_06b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- n8_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     n8_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     n8_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := n8_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l759_c7_06b4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l756_c7_00fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l756_c7_00fb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l750_c2_65ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l788_l745_DUPLICATE_8e96 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l788_l745_DUPLICATE_8e96_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cc54(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c2_65ab_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c2_65ab_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l788_l745_DUPLICATE_8e96_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l788_l745_DUPLICATE_8e96_return_output;
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
