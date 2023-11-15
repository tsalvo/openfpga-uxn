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
-- Submodules: 45
entity jcn_0CLK_85d5529e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_85d5529e;
architecture arch of jcn_0CLK_85d5529e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l638_c6_f451]
signal BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l638_c1_6041]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l638_c2_1175]
signal n8_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l638_c2_1175]
signal t8_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l638_c2_1175]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l638_c2_1175]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l638_c2_1175]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l638_c2_1175]
signal result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l638_c2_1175]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l638_c2_1175]
signal result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l639_c3_f539[uxn_opcodes_h_l639_c3_f539]
signal printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l643_c11_444a]
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l643_c7_3670]
signal n8_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l643_c7_3670]
signal t8_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l643_c7_3670]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_3670]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_3670]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_3670]
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_3670]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l643_c7_3670]
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l646_c11_5bc8]
signal BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l646_c7_38ef]
signal n8_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l646_c7_38ef]
signal t8_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l646_c7_38ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l646_c7_38ef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l646_c7_38ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l646_c7_38ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l646_c7_38ef]
signal result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l649_c11_e32b]
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l649_c7_975f]
signal n8_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_975f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_975f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_975f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_975f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l649_c7_975f]
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l652_c30_5f98]
signal sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l654_c22_4576]
signal BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l654_c37_f87d]
signal BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l654_c22_81a6]
signal MUX_uxn_opcodes_h_l654_c22_81a6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l654_c22_81a6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l654_c22_81a6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l654_c22_81a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l656_c11_eb99]
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_1361]
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l656_c7_1361]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_1361]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451
BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_left,
BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_right,
BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_return_output);

-- n8_MUX_uxn_opcodes_h_l638_c2_1175
n8_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l638_c2_1175_cond,
n8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
n8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
n8_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- t8_MUX_uxn_opcodes_h_l638_c2_1175
t8_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l638_c2_1175_cond,
t8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
t8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
t8_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175
result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175
result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175
result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175
result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175
result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_cond,
result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

-- printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539
printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539 : entity work.printf_uxn_opcodes_h_l639_c3_f539_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a
BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_left,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_right,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output);

-- n8_MUX_uxn_opcodes_h_l643_c7_3670
n8_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l643_c7_3670_cond,
n8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
n8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
n8_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- t8_MUX_uxn_opcodes_h_l643_c7_3670
t8_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l643_c7_3670_cond,
t8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
t8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
t8_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670
result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_cond,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8
BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_left,
BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_right,
BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output);

-- n8_MUX_uxn_opcodes_h_l646_c7_38ef
n8_MUX_uxn_opcodes_h_l646_c7_38ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l646_c7_38ef_cond,
n8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue,
n8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse,
n8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output);

-- t8_MUX_uxn_opcodes_h_l646_c7_38ef
t8_MUX_uxn_opcodes_h_l646_c7_38ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l646_c7_38ef_cond,
t8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue,
t8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse,
t8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef
result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef
result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef
result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef
result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b
BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_left,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_right,
BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output);

-- n8_MUX_uxn_opcodes_h_l649_c7_975f
n8_MUX_uxn_opcodes_h_l649_c7_975f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l649_c7_975f_cond,
n8_MUX_uxn_opcodes_h_l649_c7_975f_iftrue,
n8_MUX_uxn_opcodes_h_l649_c7_975f_iffalse,
n8_MUX_uxn_opcodes_h_l649_c7_975f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f
result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_cond,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l652_c30_5f98
sp_relative_shift_uxn_opcodes_h_l652_c30_5f98 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_ins,
sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_x,
sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_y,
sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576
BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_left,
BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_right,
BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d
BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_left,
BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_right,
BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_return_output);

-- MUX_uxn_opcodes_h_l654_c22_81a6
MUX_uxn_opcodes_h_l654_c22_81a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l654_c22_81a6_cond,
MUX_uxn_opcodes_h_l654_c22_81a6_iftrue,
MUX_uxn_opcodes_h_l654_c22_81a6_iffalse,
MUX_uxn_opcodes_h_l654_c22_81a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99
BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_left,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_right,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_return_output);



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
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_return_output,
 n8_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 t8_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output,
 n8_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 t8_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output,
 n8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output,
 t8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output,
 n8_MUX_uxn_opcodes_h_l649_c7_975f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_return_output,
 sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_return_output,
 MUX_uxn_opcodes_h_l654_c22_81a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l640_c3_5784 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l644_c3_6013 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l643_c7_3670_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c22_81a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c22_81a6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c22_81a6_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l654_c42_f2af_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c22_81a6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_fda4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_d1d6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_f7d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_bc2c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l649_l643_l656_l646_DUPLICATE_4161_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l634_l662_DUPLICATE_87f7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l644_c3_6013 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l644_c3_6013;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l640_c3_5784 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l640_c3_5784;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l654_c22_81a6_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l643_c7_3670_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_d1d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_d1d6_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l638_c6_f451] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_left;
     BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output := BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l643_c11_444a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_left;
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output := BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_fda4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_fda4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_f7d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_f7d1_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l649_l643_l656_l646_DUPLICATE_4161 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l649_l643_l656_l646_DUPLICATE_4161_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l654_c42_f2af] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l654_c42_f2af_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l652_c30_5f98] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_ins;
     sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_x <= VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_x;
     sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_y <= VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_return_output := sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_bc2c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_bc2c_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l649_c11_e32b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_left;
     BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output := BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l656_c11_eb99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_left;
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output := BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l646_c11_5bc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l654_c22_4576] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_left;
     BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_return_output := BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l638_c6_f451_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_444a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l646_c11_5bc8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l649_c11_e32b_return_output;
     VAR_MUX_uxn_opcodes_h_l654_c22_81a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l654_c22_4576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_eb99_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l654_c42_f2af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_fda4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_fda4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_fda4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_fda4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_bc2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_bc2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_bc2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l649_l643_l646_l638_DUPLICATE_bc2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l649_l643_l656_l646_DUPLICATE_4161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l649_l643_l656_l646_DUPLICATE_4161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l649_l643_l656_l646_DUPLICATE_4161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l649_l643_l656_l646_DUPLICATE_4161_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_d1d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_d1d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_d1d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_d1d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_f7d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_f7d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_f7d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l643_l656_l646_l638_DUPLICATE_f7d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l643_c7_3670_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l652_c30_5f98_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_1361] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l638_c1_6041] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_return_output;

     -- t8_MUX[uxn_opcodes_h_l646_c7_38ef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l646_c7_38ef_cond <= VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_cond;
     t8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue;
     t8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output := t8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_1361] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l654_c37_f87d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l656_c7_1361] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- n8_MUX[uxn_opcodes_h_l649_c7_975f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l649_c7_975f_cond <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_cond;
     n8_MUX_uxn_opcodes_h_l649_c7_975f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_iftrue;
     n8_MUX_uxn_opcodes_h_l649_c7_975f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_return_output := n8_MUX_uxn_opcodes_h_l649_c7_975f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l649_c7_975f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l654_c22_81a6_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l654_c37_f87d_return_output)),16);
     VAR_printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l638_c1_6041_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l649_c7_975f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_1361_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_1361_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_1361_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_t8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;
     -- printf_uxn_opcodes_h_l639_c3_f539[uxn_opcodes_h_l639_c3_f539] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l639_c3_f539_uxn_opcodes_h_l639_c3_f539_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l646_c7_38ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l649_c7_975f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l649_c7_975f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_return_output;

     -- t8_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     t8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     t8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_return_output := t8_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- MUX[uxn_opcodes_h_l654_c22_81a6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l654_c22_81a6_cond <= VAR_MUX_uxn_opcodes_h_l654_c22_81a6_cond;
     MUX_uxn_opcodes_h_l654_c22_81a6_iftrue <= VAR_MUX_uxn_opcodes_h_l654_c22_81a6_iftrue;
     MUX_uxn_opcodes_h_l654_c22_81a6_iffalse <= VAR_MUX_uxn_opcodes_h_l654_c22_81a6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l654_c22_81a6_return_output := MUX_uxn_opcodes_h_l654_c22_81a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l649_c7_975f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output;

     -- n8_MUX[uxn_opcodes_h_l646_c7_38ef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l646_c7_38ef_cond <= VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_cond;
     n8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue;
     n8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output := n8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iftrue := VAR_MUX_uxn_opcodes_h_l654_c22_81a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_n8_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l649_c7_975f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l649_c7_975f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l649_c7_975f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_t8_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l646_c7_38ef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l646_c7_38ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;

     -- n8_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     n8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     n8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_return_output := n8_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l646_c7_38ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;

     -- t8_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     t8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     t8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_return_output := t8_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l649_c7_975f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_return_output := result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_n8_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l649_c7_975f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l638_c2_1175_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- n8_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     n8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     n8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_return_output := n8_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l646_c7_38ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l638_c2_1175_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l646_c7_38ef_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l643_c7_3670] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_cond;
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_return_output := result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_3670_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l638_c2_1175] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_cond;
     result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_return_output := result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l634_l662_DUPLICATE_87f7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l634_l662_DUPLICATE_87f7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4c49(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l638_c2_1175_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l638_c2_1175_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l634_l662_DUPLICATE_87f7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l634_l662_DUPLICATE_87f7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
