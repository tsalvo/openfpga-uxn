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
-- BIN_OP_EQ[uxn_opcodes_h_l676_c6_58d5]
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_ccb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_761b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_761b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l676_c2_761b]
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_761b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_761b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_761b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l676_c2_761b]
signal n8_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l676_c2_761b]
signal t16_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l677_c3_c492[uxn_opcodes_h_l677_c3_c492]
signal printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c11_a4b6]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_604a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_604a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l681_c7_604a]
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_604a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_604a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_604a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l681_c7_604a]
signal n8_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l681_c7_604a]
signal t16_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l684_c11_0a31]
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_744a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_744a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l684_c7_744a]
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_744a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_744a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_744a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l684_c7_744a]
signal n8_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l684_c7_744a]
signal t16_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l686_c3_d29b]
signal CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l689_c11_9a71]
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_7044]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_7044]
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_7044]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l689_c7_7044]
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_7044]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l689_c7_7044]
signal n8_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l689_c7_7044]
signal t16_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l690_c3_8129]
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l692_c11_b865]
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_4857]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_4857]
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_4857]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l692_c7_4857]
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_4857]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l692_c7_4857]
signal n8_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l695_c30_16aa]
signal sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l696_c26_9f60]
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l696_c26_e192]
signal MUX_uxn_opcodes_h_l696_c26_e192_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_e192_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_e192_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_e192_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c22_f8ff]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l697_c22_8475]
signal MUX_uxn_opcodes_h_l697_c22_8475_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_8475_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_8475_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_8475_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l699_c11_d174]
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_660a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_660a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_660a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a132( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5
BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_left,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_right,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b
result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_cond,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- n8_MUX_uxn_opcodes_h_l676_c2_761b
n8_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l676_c2_761b_cond,
n8_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
n8_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
n8_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- t16_MUX_uxn_opcodes_h_l676_c2_761b
t16_MUX_uxn_opcodes_h_l676_c2_761b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l676_c2_761b_cond,
t16_MUX_uxn_opcodes_h_l676_c2_761b_iftrue,
t16_MUX_uxn_opcodes_h_l676_c2_761b_iffalse,
t16_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

-- printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492
printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492 : entity work.printf_uxn_opcodes_h_l677_c3_c492_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6
BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a
result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_cond,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- n8_MUX_uxn_opcodes_h_l681_c7_604a
n8_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l681_c7_604a_cond,
n8_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
n8_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
n8_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- t16_MUX_uxn_opcodes_h_l681_c7_604a
t16_MUX_uxn_opcodes_h_l681_c7_604a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l681_c7_604a_cond,
t16_MUX_uxn_opcodes_h_l681_c7_604a_iftrue,
t16_MUX_uxn_opcodes_h_l681_c7_604a_iffalse,
t16_MUX_uxn_opcodes_h_l681_c7_604a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31
BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_left,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_right,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a
result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_cond,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- n8_MUX_uxn_opcodes_h_l684_c7_744a
n8_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l684_c7_744a_cond,
n8_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
n8_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
n8_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- t16_MUX_uxn_opcodes_h_l684_c7_744a
t16_MUX_uxn_opcodes_h_l684_c7_744a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l684_c7_744a_cond,
t16_MUX_uxn_opcodes_h_l684_c7_744a_iftrue,
t16_MUX_uxn_opcodes_h_l684_c7_744a_iffalse,
t16_MUX_uxn_opcodes_h_l684_c7_744a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l686_c3_d29b
CONST_SL_8_uxn_opcodes_h_l686_c3_d29b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_x,
CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71
BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_left,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_right,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044
result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_cond,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output);

-- n8_MUX_uxn_opcodes_h_l689_c7_7044
n8_MUX_uxn_opcodes_h_l689_c7_7044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l689_c7_7044_cond,
n8_MUX_uxn_opcodes_h_l689_c7_7044_iftrue,
n8_MUX_uxn_opcodes_h_l689_c7_7044_iffalse,
n8_MUX_uxn_opcodes_h_l689_c7_7044_return_output);

-- t16_MUX_uxn_opcodes_h_l689_c7_7044
t16_MUX_uxn_opcodes_h_l689_c7_7044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l689_c7_7044_cond,
t16_MUX_uxn_opcodes_h_l689_c7_7044_iftrue,
t16_MUX_uxn_opcodes_h_l689_c7_7044_iffalse,
t16_MUX_uxn_opcodes_h_l689_c7_7044_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l690_c3_8129
BIN_OP_OR_uxn_opcodes_h_l690_c3_8129 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_left,
BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_right,
BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865
BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_left,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_right,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857
result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_cond,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output);

-- n8_MUX_uxn_opcodes_h_l692_c7_4857
n8_MUX_uxn_opcodes_h_l692_c7_4857 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l692_c7_4857_cond,
n8_MUX_uxn_opcodes_h_l692_c7_4857_iftrue,
n8_MUX_uxn_opcodes_h_l692_c7_4857_iffalse,
n8_MUX_uxn_opcodes_h_l692_c7_4857_return_output);

-- sp_relative_shift_uxn_opcodes_h_l695_c30_16aa
sp_relative_shift_uxn_opcodes_h_l695_c30_16aa : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_ins,
sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_x,
sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_y,
sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60
BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_left,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_right,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_return_output);

-- MUX_uxn_opcodes_h_l696_c26_e192
MUX_uxn_opcodes_h_l696_c26_e192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l696_c26_e192_cond,
MUX_uxn_opcodes_h_l696_c26_e192_iftrue,
MUX_uxn_opcodes_h_l696_c26_e192_iffalse,
MUX_uxn_opcodes_h_l696_c26_e192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff
BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_return_output);

-- MUX_uxn_opcodes_h_l697_c22_8475
MUX_uxn_opcodes_h_l697_c22_8475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l697_c22_8475_cond,
MUX_uxn_opcodes_h_l697_c22_8475_iftrue,
MUX_uxn_opcodes_h_l697_c22_8475_iffalse,
MUX_uxn_opcodes_h_l697_c22_8475_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174
BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_left,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_right,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 n8_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 t16_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 n8_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 t16_MUX_uxn_opcodes_h_l681_c7_604a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 n8_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 t16_MUX_uxn_opcodes_h_l684_c7_744a_return_output,
 CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output,
 n8_MUX_uxn_opcodes_h_l689_c7_7044_return_output,
 t16_MUX_uxn_opcodes_h_l689_c7_7044_return_output,
 BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output,
 n8_MUX_uxn_opcodes_h_l692_c7_4857_return_output,
 sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_return_output,
 MUX_uxn_opcodes_h_l696_c26_e192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_return_output,
 MUX_uxn_opcodes_h_l697_c22_8475_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_f44b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_6883 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_29be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_744a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_e192_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_e192_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_e192_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_e192_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_8475_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_8475_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_8475_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_8475_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_6233_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l671_l705_DUPLICATE_eb38_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_6883 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_6883;
     VAR_MUX_uxn_opcodes_h_l696_c26_e192_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_29be := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_29be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l696_c26_e192_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_f44b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_f44b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l697_c22_8475_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_left := t16;
     VAR_MUX_uxn_opcodes_h_l697_c22_8475_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l695_c30_16aa] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_ins;
     sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_x <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_x;
     sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_y <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_return_output := sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_744a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_6233 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_6233_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l676_c6_58d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l684_c11_0a31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_left;
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output := BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c22_f8ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l699_c11_d174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_left;
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output := BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l696_c26_9f60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_left;
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_return_output := BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l689_c11_9a71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_left;
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output := BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l692_c11_b865] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_left;
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output := BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c11_a4b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_58d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_a4b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_0a31_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_9a71_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_b865_return_output;
     VAR_MUX_uxn_opcodes_h_l696_c26_e192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_9f60_return_output;
     VAR_MUX_uxn_opcodes_h_l697_c22_8475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_f8ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_d174_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_6233_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_6233_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7202_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_d69e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_4c06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_cef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_9a91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_744a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_16aa_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l686_c3_d29b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_return_output := CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_660a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_return_output;

     -- n8_MUX[uxn_opcodes_h_l692_c7_4857] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l692_c7_4857_cond <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_cond;
     n8_MUX_uxn_opcodes_h_l692_c7_4857_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_iftrue;
     n8_MUX_uxn_opcodes_h_l692_c7_4857_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_return_output := n8_MUX_uxn_opcodes_h_l692_c7_4857_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l690_c3_8129] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_left;
     BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_return_output := BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_4857] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output;

     -- MUX[uxn_opcodes_h_l697_c22_8475] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l697_c22_8475_cond <= VAR_MUX_uxn_opcodes_h_l697_c22_8475_cond;
     MUX_uxn_opcodes_h_l697_c22_8475_iftrue <= VAR_MUX_uxn_opcodes_h_l697_c22_8475_iftrue;
     MUX_uxn_opcodes_h_l697_c22_8475_iffalse <= VAR_MUX_uxn_opcodes_h_l697_c22_8475_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l697_c22_8475_return_output := MUX_uxn_opcodes_h_l697_c22_8475_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_660a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_ccb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_return_output;

     -- MUX[uxn_opcodes_h_l696_c26_e192] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l696_c26_e192_cond <= VAR_MUX_uxn_opcodes_h_l696_c26_e192_cond;
     MUX_uxn_opcodes_h_l696_c26_e192_iftrue <= VAR_MUX_uxn_opcodes_h_l696_c26_e192_iftrue;
     MUX_uxn_opcodes_h_l696_c26_e192_iffalse <= VAR_MUX_uxn_opcodes_h_l696_c26_e192_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l696_c26_e192_return_output := MUX_uxn_opcodes_h_l696_c26_e192_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_660a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_8129_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_d29b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iftrue := VAR_MUX_uxn_opcodes_h_l696_c26_e192_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iftrue := VAR_MUX_uxn_opcodes_h_l697_c22_8475_return_output;
     VAR_printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_ccb6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_iffalse := VAR_n8_MUX_uxn_opcodes_h_l692_c7_4857_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_660a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_660a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_660a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_4857] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_4857] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l692_c7_4857] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_cond;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_return_output := result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_return_output;

     -- n8_MUX[uxn_opcodes_h_l689_c7_7044] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l689_c7_7044_cond <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_cond;
     n8_MUX_uxn_opcodes_h_l689_c7_7044_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_iftrue;
     n8_MUX_uxn_opcodes_h_l689_c7_7044_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_return_output := n8_MUX_uxn_opcodes_h_l689_c7_7044_return_output;

     -- printf_uxn_opcodes_h_l677_c3_c492[uxn_opcodes_h_l677_c3_c492] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l677_c3_c492_uxn_opcodes_h_l677_c3_c492_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_7044] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output;

     -- t16_MUX[uxn_opcodes_h_l689_c7_7044] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l689_c7_7044_cond <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_cond;
     t16_MUX_uxn_opcodes_h_l689_c7_7044_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_iftrue;
     t16_MUX_uxn_opcodes_h_l689_c7_7044_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_return_output := t16_MUX_uxn_opcodes_h_l689_c7_7044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_4857] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l689_c7_7044_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_4857_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_4857_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_4857_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_4857_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l689_c7_7044_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l689_c7_7044] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_cond;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_return_output := result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_return_output;

     -- t16_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     t16_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     t16_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_return_output := t16_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- n8_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     n8_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     n8_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_return_output := n8_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_7044] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_7044] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_7044] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_7044_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_7044_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_7044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_7044_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     -- n8_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     n8_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     n8_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_return_output := n8_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- t16_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     t16_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     t16_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_return_output := t16_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l684_c7_744a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_return_output := result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_744a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- n8_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     n8_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     n8_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_return_output := n8_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- t16_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     t16_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     t16_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_return_output := t16_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l681_c7_604a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_return_output := result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l676_c2_761b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_604a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l676_c2_761b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_return_output := result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_761b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l671_l705_DUPLICATE_eb38 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l671_l705_DUPLICATE_eb38_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a132(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_761b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_761b_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l671_l705_DUPLICATE_eb38_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a132_uxn_opcodes_h_l671_l705_DUPLICATE_eb38_return_output;
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
