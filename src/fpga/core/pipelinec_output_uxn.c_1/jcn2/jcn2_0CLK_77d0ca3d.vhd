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
-- BIN_OP_EQ[uxn_opcodes_h_l762_c6_7b64]
signal BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l762_c1_33c1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l762_c2_69f3]
signal t16_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l762_c2_69f3]
signal n8_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l762_c2_69f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l762_c2_69f3]
signal result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l762_c2_69f3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l762_c2_69f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l762_c2_69f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l762_c2_69f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l762_c2_69f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l763_c3_b4c6[uxn_opcodes_h_l763_c3_b4c6]
signal printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l768_c11_b22b]
signal BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l768_c7_8634]
signal t16_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l768_c7_8634]
signal n8_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l768_c7_8634]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l768_c7_8634]
signal result_pc_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l768_c7_8634]
signal result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l768_c7_8634]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l768_c7_8634]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l768_c7_8634]
signal result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l768_c7_8634]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l771_c11_ebfe]
signal BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l771_c7_404d]
signal t16_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l771_c7_404d]
signal n8_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c7_404d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l771_c7_404d]
signal result_pc_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l771_c7_404d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c7_404d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c7_404d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l771_c7_404d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c7_404d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l773_c3_644f]
signal CONST_SL_8_uxn_opcodes_h_l773_c3_644f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l773_c3_644f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l776_c11_2f7e]
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l776_c7_cf86]
signal t16_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l776_c7_cf86]
signal n8_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_cf86]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l776_c7_cf86]
signal result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l776_c7_cf86]
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c7_cf86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c7_cf86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_cf86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c7_cf86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l779_c11_b0d3]
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l779_c7_a817]
signal t16_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l779_c7_a817]
signal n8_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_a817]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l779_c7_a817]
signal result_pc_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l779_c7_a817]
signal result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_a817]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l779_c7_a817]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_a817]
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_a817]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l780_c3_fc13]
signal BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l783_c11_fdf0]
signal BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l783_c7_bc24]
signal n8_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l783_c7_bc24]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l783_c7_bc24]
signal result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l783_c7_bc24]
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l783_c7_bc24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l783_c7_bc24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l783_c7_bc24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l783_c7_bc24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l786_c11_eddf]
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l786_c7_8065]
signal n8_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_8065]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l786_c7_8065]
signal result_pc_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l786_c7_8065]
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_8065]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l786_c7_8065]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_8065]
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l790_c32_8628]
signal BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l790_c32_dfc6]
signal BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l790_c32_99ea]
signal MUX_uxn_opcodes_h_l790_c32_99ea_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l790_c32_99ea_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l790_c32_99ea_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l790_c32_99ea_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l791_c26_0b8a]
signal BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l791_c26_134a]
signal MUX_uxn_opcodes_h_l791_c26_134a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l791_c26_134a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l791_c26_134a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l791_c26_134a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l792_c15_198f]
signal BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l792_c15_1ce3]
signal MUX_uxn_opcodes_h_l792_c15_1ce3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l792_c15_1ce3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l792_c15_1ce3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l792_c15_1ce3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_363b]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_70f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l794_c7_70f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_70f5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_747d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.pc := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64
BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_left,
BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_right,
BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_return_output);

-- t16_MUX_uxn_opcodes_h_l762_c2_69f3
t16_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
t16_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
t16_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
t16_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- n8_MUX_uxn_opcodes_h_l762_c2_69f3
n8_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
n8_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
n8_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
n8_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l762_c2_69f3
result_pc_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3
result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3
result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

-- printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6
printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6 : entity work.printf_uxn_opcodes_h_l763_c3_b4c6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b
BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_left,
BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_right,
BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output);

-- t16_MUX_uxn_opcodes_h_l768_c7_8634
t16_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l768_c7_8634_cond,
t16_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
t16_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
t16_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- n8_MUX_uxn_opcodes_h_l768_c7_8634
n8_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l768_c7_8634_cond,
n8_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
n8_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
n8_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634
result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- result_pc_MUX_uxn_opcodes_h_l768_c7_8634
result_pc_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l768_c7_8634_cond,
result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
result_pc_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634
result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634
result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634
result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634
result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe
BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_left,
BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_right,
BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output);

-- t16_MUX_uxn_opcodes_h_l771_c7_404d
t16_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l771_c7_404d_cond,
t16_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
t16_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
t16_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- n8_MUX_uxn_opcodes_h_l771_c7_404d
n8_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l771_c7_404d_cond,
n8_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
n8_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
n8_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l771_c7_404d
result_pc_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l771_c7_404d_cond,
result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
result_pc_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l773_c3_644f
CONST_SL_8_uxn_opcodes_h_l773_c3_644f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l773_c3_644f_x,
CONST_SL_8_uxn_opcodes_h_l773_c3_644f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e
BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_left,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_right,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output);

-- t16_MUX_uxn_opcodes_h_l776_c7_cf86
t16_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
t16_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
t16_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
t16_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- n8_MUX_uxn_opcodes_h_l776_c7_cf86
n8_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
n8_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
n8_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
n8_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- result_pc_MUX_uxn_opcodes_h_l776_c7_cf86
result_pc_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86
result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3
BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_left,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_right,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output);

-- t16_MUX_uxn_opcodes_h_l779_c7_a817
t16_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l779_c7_a817_cond,
t16_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
t16_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
t16_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- n8_MUX_uxn_opcodes_h_l779_c7_a817
n8_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l779_c7_a817_cond,
n8_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
n8_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
n8_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- result_pc_MUX_uxn_opcodes_h_l779_c7_a817
result_pc_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l779_c7_a817_cond,
result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
result_pc_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817
result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13
BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_left,
BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_right,
BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0
BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_left,
BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_right,
BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output);

-- n8_MUX_uxn_opcodes_h_l783_c7_bc24
n8_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
n8_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
n8_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
n8_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24
result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- result_pc_MUX_uxn_opcodes_h_l783_c7_bc24
result_pc_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf
BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_left,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_right,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output);

-- n8_MUX_uxn_opcodes_h_l786_c7_8065
n8_MUX_uxn_opcodes_h_l786_c7_8065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l786_c7_8065_cond,
n8_MUX_uxn_opcodes_h_l786_c7_8065_iftrue,
n8_MUX_uxn_opcodes_h_l786_c7_8065_iffalse,
n8_MUX_uxn_opcodes_h_l786_c7_8065_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_return_output);

-- result_pc_MUX_uxn_opcodes_h_l786_c7_8065
result_pc_MUX_uxn_opcodes_h_l786_c7_8065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l786_c7_8065_cond,
result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iftrue,
result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iffalse,
result_pc_MUX_uxn_opcodes_h_l786_c7_8065_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l790_c32_8628
BIN_OP_AND_uxn_opcodes_h_l790_c32_8628 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_left,
BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_right,
BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6
BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_left,
BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_right,
BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_return_output);

-- MUX_uxn_opcodes_h_l790_c32_99ea
MUX_uxn_opcodes_h_l790_c32_99ea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l790_c32_99ea_cond,
MUX_uxn_opcodes_h_l790_c32_99ea_iftrue,
MUX_uxn_opcodes_h_l790_c32_99ea_iffalse,
MUX_uxn_opcodes_h_l790_c32_99ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a
BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_left,
BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_right,
BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_return_output);

-- MUX_uxn_opcodes_h_l791_c26_134a
MUX_uxn_opcodes_h_l791_c26_134a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l791_c26_134a_cond,
MUX_uxn_opcodes_h_l791_c26_134a_iftrue,
MUX_uxn_opcodes_h_l791_c26_134a_iffalse,
MUX_uxn_opcodes_h_l791_c26_134a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f
BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_left,
BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_right,
BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_return_output);

-- MUX_uxn_opcodes_h_l792_c15_1ce3
MUX_uxn_opcodes_h_l792_c15_1ce3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l792_c15_1ce3_cond,
MUX_uxn_opcodes_h_l792_c15_1ce3_iftrue,
MUX_uxn_opcodes_h_l792_c15_1ce3_iffalse,
MUX_uxn_opcodes_h_l792_c15_1ce3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b
BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_return_output,
 t16_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 n8_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output,
 t16_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 n8_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 result_pc_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output,
 t16_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 n8_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 result_pc_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_return_output,
 CONST_SL_8_uxn_opcodes_h_l773_c3_644f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output,
 t16_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 n8_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output,
 t16_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 n8_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 result_pc_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_return_output,
 BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output,
 n8_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output,
 n8_MUX_uxn_opcodes_h_l786_c7_8065_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_return_output,
 result_pc_MUX_uxn_opcodes_h_l786_c7_8065_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_return_output,
 BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_return_output,
 BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_return_output,
 MUX_uxn_opcodes_h_l790_c32_99ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_return_output,
 MUX_uxn_opcodes_h_l791_c26_134a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_return_output,
 MUX_uxn_opcodes_h_l792_c15_1ce3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l765_c3_53ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_956a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_9a2c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l773_c3_644f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l773_c3_644f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_c1bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_182b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_8db1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l783_c7_bc24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l790_c32_99ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l790_c32_99ea_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l790_c32_99ea_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l790_c32_99ea_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l791_c26_134a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l791_c26_134a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l791_c26_134a_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l791_c26_134a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l780_l772_DUPLICATE_da43_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l800_l757_DUPLICATE_a529_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_956a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_956a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_9a2c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_9a2c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_182b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_182b;
     VAR_MUX_uxn_opcodes_h_l790_c32_99ea_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l765_c3_53ce := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l765_c3_53ce;
     VAR_MUX_uxn_opcodes_h_l791_c26_134a_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l790_c32_99ea_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l791_c26_134a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_8db1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_8db1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_c1bd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_c1bd;
     VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_left := t16;
     VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l783_c11_fdf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_left;
     BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output := BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l780_l772_DUPLICATE_da43 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l780_l772_DUPLICATE_da43_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l779_c11_b0d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_363b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l768_c11_b22b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_left;
     BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output := BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l792_c15_198f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_left;
     BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_return_output := BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l762_c6_7b64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_left;
     BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output := BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l783_c7_bc24_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l790_c32_8628] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_left;
     BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_return_output := BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l771_c11_ebfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l791_c26_0b8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l776_c11_2f7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l786_c11_eddf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_left;
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output := BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l790_c32_8628_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l762_c6_7b64_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l768_c11_b22b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c11_ebfe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_2f7e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_b0d3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l783_c11_fdf0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_eddf_return_output;
     VAR_MUX_uxn_opcodes_h_l791_c26_134a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c26_0b8a_return_output;
     VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l792_c15_198f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_363b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l780_l772_DUPLICATE_da43_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l773_c3_644f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l780_l772_DUPLICATE_da43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_711f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l762_l786_DUPLICATE_73d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l786_DUPLICATE_7d3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_75d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l794_l762_DUPLICATE_ff87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l783_l779_l776_l771_l768_l786_DUPLICATE_bb1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l783_c7_bc24_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l790_c32_dfc6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_left;
     BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_return_output := BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l780_c3_fc13] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_left;
     BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_return_output := BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_return_output;

     -- n8_MUX[uxn_opcodes_h_l786_c7_8065] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l786_c7_8065_cond <= VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_cond;
     n8_MUX_uxn_opcodes_h_l786_c7_8065_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_iftrue;
     n8_MUX_uxn_opcodes_h_l786_c7_8065_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_return_output := n8_MUX_uxn_opcodes_h_l786_c7_8065_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l762_c1_33c1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l794_c7_70f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_return_output;

     -- MUX[uxn_opcodes_h_l792_c15_1ce3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l792_c15_1ce3_cond <= VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_cond;
     MUX_uxn_opcodes_h_l792_c15_1ce3_iftrue <= VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_iftrue;
     MUX_uxn_opcodes_h_l792_c15_1ce3_iffalse <= VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_return_output := MUX_uxn_opcodes_h_l792_c15_1ce3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_70f5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l773_c3_644f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l773_c3_644f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l773_c3_644f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l773_c3_644f_return_output := CONST_SL_8_uxn_opcodes_h_l773_c3_644f_return_output;

     -- MUX[uxn_opcodes_h_l791_c26_134a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l791_c26_134a_cond <= VAR_MUX_uxn_opcodes_h_l791_c26_134a_cond;
     MUX_uxn_opcodes_h_l791_c26_134a_iftrue <= VAR_MUX_uxn_opcodes_h_l791_c26_134a_iftrue;
     MUX_uxn_opcodes_h_l791_c26_134a_iffalse <= VAR_MUX_uxn_opcodes_h_l791_c26_134a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l791_c26_134a_return_output := MUX_uxn_opcodes_h_l791_c26_134a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_70f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l786_c7_8065] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l790_c32_99ea_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l790_c32_dfc6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_fc13_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l773_c3_644f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iftrue := VAR_MUX_uxn_opcodes_h_l791_c26_134a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iftrue := VAR_MUX_uxn_opcodes_h_l792_c15_1ce3_return_output;
     VAR_printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l762_c1_33c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_n8_MUX_uxn_opcodes_h_l786_c7_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_70f5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_70f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l794_c7_70f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l786_c7_8065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_8065] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l786_c7_8065] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output;

     -- t16_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     t16_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     t16_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_return_output := t16_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l786_c7_8065] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l786_c7_8065_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_cond;
     result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iftrue;
     result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_return_output := result_pc_MUX_uxn_opcodes_h_l786_c7_8065_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- n8_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     n8_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     n8_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := n8_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- MUX[uxn_opcodes_h_l790_c32_99ea] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l790_c32_99ea_cond <= VAR_MUX_uxn_opcodes_h_l790_c32_99ea_cond;
     MUX_uxn_opcodes_h_l790_c32_99ea_iftrue <= VAR_MUX_uxn_opcodes_h_l790_c32_99ea_iftrue;
     MUX_uxn_opcodes_h_l790_c32_99ea_iffalse <= VAR_MUX_uxn_opcodes_h_l790_c32_99ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l790_c32_99ea_return_output := MUX_uxn_opcodes_h_l790_c32_99ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_8065] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_return_output;

     -- printf_uxn_opcodes_h_l763_c3_b4c6[uxn_opcodes_h_l763_c3_b4c6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l763_c3_b4c6_uxn_opcodes_h_l763_c3_b4c6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue := VAR_MUX_uxn_opcodes_h_l790_c32_99ea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_n8_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_8065_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_8065_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l786_c7_8065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_t16_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_8065] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output;

     -- n8_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     n8_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     n8_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_return_output := n8_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- t16_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     t16_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     t16_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := t16_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_n8_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_8065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l783_c7_bc24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_return_output := result_pc_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- t16_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     t16_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     t16_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_return_output := t16_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- n8_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     n8_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     n8_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := n8_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l783_c7_bc24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_t16_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     -- t16_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     t16_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     t16_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_return_output := t16_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_a817] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- n8_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     n8_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     n8_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_return_output := n8_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_n8_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_a817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- t16_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     t16_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     t16_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := t16_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_return_output := result_pc_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c7_cf86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;

     -- n8_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     n8_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     n8_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_return_output := n8_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_cf86_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_return_output := result_pc_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c7_404d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- n8_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     n8_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     n8_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := n8_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c7_404d_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l768_c7_8634] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l768_c7_8634_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l762_c2_69f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l800_l757_DUPLICATE_a529 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l800_l757_DUPLICATE_a529_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_747d(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l762_c2_69f3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l762_c2_69f3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l800_l757_DUPLICATE_a529_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l800_l757_DUPLICATE_a529_return_output;
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
