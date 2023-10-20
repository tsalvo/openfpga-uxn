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
-- Submodules: 73
entity jcn2_0CLK_862e49ca is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_862e49ca;
architecture arch of jcn2_0CLK_862e49ca is
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
-- BIN_OP_EQ[uxn_opcodes_h_l724_c6_3809]
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l724_c2_a883]
signal n8_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l724_c2_a883]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l724_c2_a883]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l724_c2_a883]
signal result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l724_c2_a883]
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l724_c2_a883]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l724_c2_a883]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l724_c2_a883]
signal t16_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l729_c11_ea95]
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal n8_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l729_c7_ae3d]
signal t16_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l732_c11_fdd2]
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l732_c7_5aad]
signal n8_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_5aad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_5aad]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l732_c7_5aad]
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_5aad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l732_c7_5aad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_5aad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l732_c7_5aad]
signal t16_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l734_c3_e9e1]
signal CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c11_f342]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l737_c7_baa6]
signal n8_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_baa6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_baa6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l737_c7_baa6]
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_baa6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_baa6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_baa6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l737_c7_baa6]
signal t16_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l740_c11_290a]
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l740_c7_fda6]
signal n8_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_fda6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l740_c7_fda6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l740_c7_fda6]
signal result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_fda6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_fda6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_fda6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l740_c7_fda6]
signal t16_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l741_c3_788c]
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l744_c11_55d7]
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l744_c7_6255]
signal n8_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_6255]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_6255]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l744_c7_6255]
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_6255]
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_6255]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_6255]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l747_c11_3e56]
signal BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l747_c7_0ec2]
signal n8_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l747_c7_0ec2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l747_c7_0ec2]
signal result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l747_c7_0ec2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l747_c7_0ec2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l747_c7_0ec2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l750_c30_c23e]
signal sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l751_c26_9a55]
signal BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l751_c26_ee1a]
signal MUX_uxn_opcodes_h_l751_c26_ee1a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l751_c26_ee1a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l751_c26_ee1a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l751_c26_ee1a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l752_c22_2b01]
signal BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l752_c22_9dcd]
signal MUX_uxn_opcodes_h_l752_c22_9dcd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l752_c22_9dcd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l752_c22_9dcd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l752_c22_9dcd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l754_c11_90a0]
signal BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l754_c7_5beb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l754_c7_5beb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l754_c7_5beb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_left,
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_right,
BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output);

-- n8_MUX_uxn_opcodes_h_l724_c2_a883
n8_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l724_c2_a883_cond,
n8_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
n8_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
n8_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883
result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_cond,
result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- t16_MUX_uxn_opcodes_h_l724_c2_a883
t16_MUX_uxn_opcodes_h_l724_c2_a883 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l724_c2_a883_cond,
t16_MUX_uxn_opcodes_h_l724_c2_a883_iftrue,
t16_MUX_uxn_opcodes_h_l724_c2_a883_iffalse,
t16_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95
BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_left,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_right,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output);

-- n8_MUX_uxn_opcodes_h_l729_c7_ae3d
n8_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
n8_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d
result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- t16_MUX_uxn_opcodes_h_l729_c7_ae3d
t16_MUX_uxn_opcodes_h_l729_c7_ae3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l729_c7_ae3d_cond,
t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue,
t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse,
t16_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2
BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_left,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_right,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output);

-- n8_MUX_uxn_opcodes_h_l732_c7_5aad
n8_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
n8_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
n8_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
n8_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad
result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- t16_MUX_uxn_opcodes_h_l732_c7_5aad
t16_MUX_uxn_opcodes_h_l732_c7_5aad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l732_c7_5aad_cond,
t16_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue,
t16_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse,
t16_MUX_uxn_opcodes_h_l732_c7_5aad_return_output);

-- CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1
CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_x,
CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342
BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output);

-- n8_MUX_uxn_opcodes_h_l737_c7_baa6
n8_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
n8_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
n8_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
n8_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6
result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- t16_MUX_uxn_opcodes_h_l737_c7_baa6
t16_MUX_uxn_opcodes_h_l737_c7_baa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l737_c7_baa6_cond,
t16_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue,
t16_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse,
t16_MUX_uxn_opcodes_h_l737_c7_baa6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a
BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_left,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_right,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output);

-- n8_MUX_uxn_opcodes_h_l740_c7_fda6
n8_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
n8_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
n8_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
n8_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6
result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- t16_MUX_uxn_opcodes_h_l740_c7_fda6
t16_MUX_uxn_opcodes_h_l740_c7_fda6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l740_c7_fda6_cond,
t16_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue,
t16_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse,
t16_MUX_uxn_opcodes_h_l740_c7_fda6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l741_c3_788c
BIN_OP_OR_uxn_opcodes_h_l741_c3_788c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_left,
BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_right,
BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7
BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_left,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_right,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output);

-- n8_MUX_uxn_opcodes_h_l744_c7_6255
n8_MUX_uxn_opcodes_h_l744_c7_6255 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l744_c7_6255_cond,
n8_MUX_uxn_opcodes_h_l744_c7_6255_iftrue,
n8_MUX_uxn_opcodes_h_l744_c7_6255_iffalse,
n8_MUX_uxn_opcodes_h_l744_c7_6255_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255
result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_cond,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56
BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_left,
BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_right,
BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output);

-- n8_MUX_uxn_opcodes_h_l747_c7_0ec2
n8_MUX_uxn_opcodes_h_l747_c7_0ec2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l747_c7_0ec2_cond,
n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue,
n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse,
n8_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2
result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_cond,
result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l750_c30_c23e
sp_relative_shift_uxn_opcodes_h_l750_c30_c23e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_ins,
sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_x,
sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_y,
sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55
BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_left,
BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_right,
BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_return_output);

-- MUX_uxn_opcodes_h_l751_c26_ee1a
MUX_uxn_opcodes_h_l751_c26_ee1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l751_c26_ee1a_cond,
MUX_uxn_opcodes_h_l751_c26_ee1a_iftrue,
MUX_uxn_opcodes_h_l751_c26_ee1a_iffalse,
MUX_uxn_opcodes_h_l751_c26_ee1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01
BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_left,
BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_right,
BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_return_output);

-- MUX_uxn_opcodes_h_l752_c22_9dcd
MUX_uxn_opcodes_h_l752_c22_9dcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l752_c22_9dcd_cond,
MUX_uxn_opcodes_h_l752_c22_9dcd_iftrue,
MUX_uxn_opcodes_h_l752_c22_9dcd_iffalse,
MUX_uxn_opcodes_h_l752_c22_9dcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0
BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_left,
BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_right,
BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output,
 n8_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 t16_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output,
 n8_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 t16_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output,
 n8_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 t16_MUX_uxn_opcodes_h_l732_c7_5aad_return_output,
 CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output,
 n8_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 t16_MUX_uxn_opcodes_h_l737_c7_baa6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output,
 n8_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 t16_MUX_uxn_opcodes_h_l740_c7_fda6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output,
 n8_MUX_uxn_opcodes_h_l744_c7_6255_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output,
 n8_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output,
 sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_return_output,
 MUX_uxn_opcodes_h_l751_c26_ee1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_return_output,
 MUX_uxn_opcodes_h_l752_c22_9dcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_bcf9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_d80b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_d8f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_40bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_bc11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_c2a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l744_c7_6255_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_e6ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l760_l719_DUPLICATE_0e72_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_d80b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_d80b;
     VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_iffalse := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_bc11 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_bc11;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_d8f0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_d8f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_c2a4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_c2a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_40bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_40bd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_bcf9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_bcf9;
     VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_iftrue := resize(to_unsigned(0, 1), 16);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_left := t16;
     VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_e6ce LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_e6ce_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l747_c11_3e56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_left;
     BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output := BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l751_c26_9a55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_left;
     BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_return_output := BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l752_c22_2b01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_left;
     BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_return_output := BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l754_c11_90a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l750_c30_c23e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_ins;
     sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_x;
     sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_return_output := sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l729_c11_ea95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_left;
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output := BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l724_c6_3809] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_left;
     BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output := BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l732_c11_fdd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l744_c7_6255_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c11_f342] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l740_c11_290a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_left;
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output := BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l744_c11_55d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_3809_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_ea95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_fdd2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_f342_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_290a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_55d7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_3e56_return_output;
     VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_9a55_return_output;
     VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c22_2b01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_90a0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_e6ce_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_e6ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_fc24_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l744_l724_l747_l737_l740_l732_l729_DUPLICATE_a624_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l747_l737_l754_l740_l732_l729_DUPLICATE_8fd1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_ff55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l724_l737_l754_l740_l732_l729_DUPLICATE_3f8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l744_c7_6255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l750_c30_c23e_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l734_c3_e9e1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_x <= VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_return_output := CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l754_c7_5beb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l754_c7_5beb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l747_c7_0ec2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l754_c7_5beb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_return_output;

     -- n8_MUX[uxn_opcodes_h_l747_c7_0ec2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l747_c7_0ec2_cond <= VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_cond;
     n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue;
     n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output := n8_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;

     -- MUX[uxn_opcodes_h_l752_c22_9dcd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l752_c22_9dcd_cond <= VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_cond;
     MUX_uxn_opcodes_h_l752_c22_9dcd_iftrue <= VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_iftrue;
     MUX_uxn_opcodes_h_l752_c22_9dcd_iffalse <= VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_return_output := MUX_uxn_opcodes_h_l752_c22_9dcd_return_output;

     -- MUX[uxn_opcodes_h_l751_c26_ee1a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l751_c26_ee1a_cond <= VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_cond;
     MUX_uxn_opcodes_h_l751_c26_ee1a_iftrue <= VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_iftrue;
     MUX_uxn_opcodes_h_l751_c26_ee1a_iffalse <= VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_return_output := MUX_uxn_opcodes_h_l751_c26_ee1a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l741_c3_788c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_left;
     BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_return_output := BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_788c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_e9e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue := VAR_MUX_uxn_opcodes_h_l751_c26_ee1a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue := VAR_MUX_uxn_opcodes_h_l752_c22_9dcd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_iffalse := VAR_n8_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5beb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5beb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5beb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_6255_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l747_c7_0ec2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l747_c7_0ec2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;

     -- n8_MUX[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l744_c7_6255_cond <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_cond;
     n8_MUX_uxn_opcodes_h_l744_c7_6255_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_iftrue;
     n8_MUX_uxn_opcodes_h_l744_c7_6255_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_return_output := n8_MUX_uxn_opcodes_h_l744_c7_6255_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l747_c7_0ec2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;

     -- t16_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     t16_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     t16_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := t16_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l747_c7_0ec2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output := result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l744_c7_6255_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l747_c7_0ec2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_cond;
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_return_output := result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_return_output;

     -- t16_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     t16_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     t16_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := t16_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_6255] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_return_output;

     -- n8_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     n8_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     n8_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := n8_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_6255_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_6255_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_6255_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_6255_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- n8_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     n8_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     n8_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := n8_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- t16_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     t16_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     t16_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := t16_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_fda6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_n8_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l740_c7_fda6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     -- n8_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     n8_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     n8_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := n8_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- t16_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := t16_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_baa6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_baa6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_t16_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l732_c7_5aad] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_cond;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_return_output := result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;

     -- n8_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := n8_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- t16_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     t16_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     t16_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_return_output := t16_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_n8_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_5aad_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l724_c2_a883_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- n8_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     n8_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     n8_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_return_output := n8_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_ae3d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l724_c2_a883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_ae3d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_return_output := result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l724_c2_a883] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l760_l719_DUPLICATE_0e72 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l760_l719_DUPLICATE_0e72_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_a883_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l760_l719_DUPLICATE_0e72_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l760_l719_DUPLICATE_0e72_return_output;
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
