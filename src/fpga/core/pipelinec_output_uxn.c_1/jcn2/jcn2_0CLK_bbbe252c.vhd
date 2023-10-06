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
-- Submodules: 88
entity jcn2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_bbbe252c;
architecture arch of jcn2_0CLK_bbbe252c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l782_c6_8b7d]
signal BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l782_c1_3602]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l782_c2_daa1]
signal n8_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l782_c2_daa1]
signal t16_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c2_daa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l782_c2_daa1]
signal result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l782_c2_daa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l782_c2_daa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l782_c2_daa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l782_c2_daa1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l782_c2_daa1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l783_c3_8470[uxn_opcodes_h_l783_c3_8470]
signal printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l788_c11_6689]
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l788_c7_95fa]
signal n8_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l788_c7_95fa]
signal t16_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l788_c7_95fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l788_c7_95fa]
signal result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l788_c7_95fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l788_c7_95fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l788_c7_95fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l788_c7_95fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l788_c7_95fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l791_c11_cee8]
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l791_c7_40b5]
signal n8_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l791_c7_40b5]
signal t16_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l791_c7_40b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l791_c7_40b5]
signal result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l791_c7_40b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l791_c7_40b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_40b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l791_c7_40b5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l791_c7_40b5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l793_c3_68b8]
signal CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l796_c11_16aa]
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l796_c7_95eb]
signal n8_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l796_c7_95eb]
signal t16_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l796_c7_95eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l796_c7_95eb]
signal result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l796_c7_95eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l796_c7_95eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l796_c7_95eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l796_c7_95eb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l796_c7_95eb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l799_c11_a1df]
signal BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal n8_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal t16_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l799_c7_ef8d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l800_c3_634f]
signal BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l803_c11_0ffc]
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l803_c7_7859]
signal n8_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l803_c7_7859]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l803_c7_7859]
signal result_pc_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_7859]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_7859]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_7859]
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_7859]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l803_c7_7859]
signal result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l806_c11_a3aa]
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l806_c7_c470]
signal n8_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_c470]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l806_c7_c470]
signal result_pc_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_c470]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_c470]
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_c470]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_c470]
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l810_c32_92da]
signal BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l810_c32_65ee]
signal BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l810_c32_5b20]
signal MUX_uxn_opcodes_h_l810_c32_5b20_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l810_c32_5b20_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l810_c32_5b20_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l810_c32_5b20_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l812_c11_9e76]
signal BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l812_c7_3b2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l812_c7_3b2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l812_c7_3b2a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l812_c7_3b2a]
signal result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l814_c26_762b]
signal BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l814_c26_0dd4]
signal MUX_uxn_opcodes_h_l814_c26_0dd4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l814_c26_0dd4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l814_c26_0dd4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l814_c26_0dd4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l815_c15_2266]
signal BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l815_c15_8d58]
signal MUX_uxn_opcodes_h_l815_c15_8d58_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l815_c15_8d58_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l815_c15_8d58_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l815_c15_8d58_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l817_c11_369a]
signal BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l817_c7_743c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l817_c7_743c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_89b6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.pc := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d
BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_left,
BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_right,
BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_return_output);

-- n8_MUX_uxn_opcodes_h_l782_c2_daa1
n8_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
n8_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
n8_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
n8_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- t16_MUX_uxn_opcodes_h_l782_c2_daa1
t16_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
t16_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
t16_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
t16_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l782_c2_daa1
result_pc_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1
result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1
result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

-- printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470
printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470 : entity work.printf_uxn_opcodes_h_l783_c3_8470_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689
BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_left,
BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_right,
BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output);

-- n8_MUX_uxn_opcodes_h_l788_c7_95fa
n8_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
n8_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
n8_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
n8_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- t16_MUX_uxn_opcodes_h_l788_c7_95fa
t16_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
t16_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
t16_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
t16_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- result_pc_MUX_uxn_opcodes_h_l788_c7_95fa
result_pc_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa
result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8
BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_left,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_right,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output);

-- n8_MUX_uxn_opcodes_h_l791_c7_40b5
n8_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
n8_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
n8_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
n8_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- t16_MUX_uxn_opcodes_h_l791_c7_40b5
t16_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
t16_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
t16_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
t16_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l791_c7_40b5
result_pc_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l793_c3_68b8
CONST_SL_8_uxn_opcodes_h_l793_c3_68b8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_x,
CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa
BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_left,
BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_right,
BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output);

-- n8_MUX_uxn_opcodes_h_l796_c7_95eb
n8_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
n8_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
n8_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
n8_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- t16_MUX_uxn_opcodes_h_l796_c7_95eb
t16_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
t16_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
t16_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
t16_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb
result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l796_c7_95eb
result_pc_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb
result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df
BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_left,
BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_right,
BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output);

-- n8_MUX_uxn_opcodes_h_l799_c7_ef8d
n8_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
n8_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- t16_MUX_uxn_opcodes_h_l799_c7_ef8d
t16_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
t16_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d
result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d
result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d
result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d
result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d
result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l800_c3_634f
BIN_OP_OR_uxn_opcodes_h_l800_c3_634f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_left,
BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_right,
BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_left,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_right,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output);

-- n8_MUX_uxn_opcodes_h_l803_c7_7859
n8_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l803_c7_7859_cond,
n8_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
n8_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
n8_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859
result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- result_pc_MUX_uxn_opcodes_h_l803_c7_7859
result_pc_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l803_c7_7859_cond,
result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
result_pc_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859
result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa
BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_left,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_right,
BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output);

-- n8_MUX_uxn_opcodes_h_l806_c7_c470
n8_MUX_uxn_opcodes_h_l806_c7_c470 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l806_c7_c470_cond,
n8_MUX_uxn_opcodes_h_l806_c7_c470_iftrue,
n8_MUX_uxn_opcodes_h_l806_c7_c470_iffalse,
n8_MUX_uxn_opcodes_h_l806_c7_c470_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output);

-- result_pc_MUX_uxn_opcodes_h_l806_c7_c470
result_pc_MUX_uxn_opcodes_h_l806_c7_c470 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l806_c7_c470_cond,
result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iftrue,
result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iffalse,
result_pc_MUX_uxn_opcodes_h_l806_c7_c470_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l810_c32_92da
BIN_OP_AND_uxn_opcodes_h_l810_c32_92da : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_left,
BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_right,
BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee
BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_left,
BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_right,
BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_return_output);

-- MUX_uxn_opcodes_h_l810_c32_5b20
MUX_uxn_opcodes_h_l810_c32_5b20 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l810_c32_5b20_cond,
MUX_uxn_opcodes_h_l810_c32_5b20_iftrue,
MUX_uxn_opcodes_h_l810_c32_5b20_iffalse,
MUX_uxn_opcodes_h_l810_c32_5b20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76
BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_left,
BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_right,
BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a
result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a
result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a
result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a
result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_cond,
result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue,
result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse,
result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b
BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_left,
BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_right,
BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_return_output);

-- MUX_uxn_opcodes_h_l814_c26_0dd4
MUX_uxn_opcodes_h_l814_c26_0dd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l814_c26_0dd4_cond,
MUX_uxn_opcodes_h_l814_c26_0dd4_iftrue,
MUX_uxn_opcodes_h_l814_c26_0dd4_iffalse,
MUX_uxn_opcodes_h_l814_c26_0dd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266
BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_left,
BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_right,
BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_return_output);

-- MUX_uxn_opcodes_h_l815_c15_8d58
MUX_uxn_opcodes_h_l815_c15_8d58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l815_c15_8d58_cond,
MUX_uxn_opcodes_h_l815_c15_8d58_iftrue,
MUX_uxn_opcodes_h_l815_c15_8d58_iffalse,
MUX_uxn_opcodes_h_l815_c15_8d58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a
BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_left,
BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_right,
BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c
result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_return_output,
 n8_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 t16_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output,
 n8_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 t16_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output,
 n8_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 t16_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_return_output,
 CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output,
 n8_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 t16_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output,
 n8_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 t16_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output,
 n8_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 result_pc_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output,
 n8_MUX_uxn_opcodes_h_l806_c7_c470_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output,
 result_pc_MUX_uxn_opcodes_h_l806_c7_c470_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_return_output,
 BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_return_output,
 BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_return_output,
 MUX_uxn_opcodes_h_l810_c32_5b20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output,
 result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_return_output,
 MUX_uxn_opcodes_h_l814_c26_0dd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_return_output,
 MUX_uxn_opcodes_h_l815_c15_8d58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l785_c3_007b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_6b23 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l794_c3_8818 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l797_c3_ace1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l801_c3_ea4f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_983e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_c7_7859_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l810_c32_5b20_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l810_c32_5b20_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l810_c32_5b20_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l810_c32_5b20_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l815_c15_8d58_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l815_c15_8d58_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l815_c15_8d58_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l815_c15_8d58_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l792_l800_DUPLICATE_7826_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l822_l777_DUPLICATE_33d6_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l815_c15_8d58_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_iffalse := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l810_c32_5b20_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_6b23 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_6b23;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l797_c3_ace1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l797_c3_ace1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l794_c3_8818 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l794_c3_8818;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l810_c32_5b20_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_983e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_983e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l801_c3_ea4f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l801_c3_ea4f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l785_c3_007b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l785_c3_007b;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_left := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_left := t16;
     VAR_MUX_uxn_opcodes_h_l815_c15_8d58_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l782_c6_8b7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l799_c11_a1df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_left;
     BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output := BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l817_c11_369a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_left;
     BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output := BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l812_c11_9e76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_left;
     BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output := BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l788_c11_6689] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_left;
     BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output := BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l810_c32_92da] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_left;
     BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_return_output := BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l815_c15_2266] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_left;
     BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_return_output := BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l806_c11_a3aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output := result.pc;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l792_l800_DUPLICATE_7826 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l792_l800_DUPLICATE_7826_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_c7_7859_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l791_c11_cee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_left;
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output := BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l814_c26_762b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_left;
     BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_return_output := BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l803_c11_0ffc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_left;
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output := BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l796_c11_16aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_left := VAR_BIN_OP_AND_uxn_opcodes_h_l810_c32_92da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c6_8b7d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_6689_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_cee8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_16aa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l799_c11_a1df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_0ffc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l806_c11_a3aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l812_c11_9e76_return_output;
     VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c26_762b_return_output;
     VAR_MUX_uxn_opcodes_h_l815_c15_8d58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c15_2266_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_369a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l792_l800_DUPLICATE_7826_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l792_l800_DUPLICATE_7826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l782_l806_l803_DUPLICATE_86fd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l806_l803_DUPLICATE_f97d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l812_l806_l803_DUPLICATE_620c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l799_l796_l791_l817_l788_l782_l806_l803_DUPLICATE_077c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l799_l796_l791_l788_l812_l782_l803_DUPLICATE_128d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l799_l796_l791_l788_l806_l803_DUPLICATE_899a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_c7_7859_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l817_c7_743c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l800_c3_634f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_left;
     BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_return_output := BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_return_output;

     -- n8_MUX[uxn_opcodes_h_l806_c7_c470] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l806_c7_c470_cond <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_cond;
     n8_MUX_uxn_opcodes_h_l806_c7_c470_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_iftrue;
     n8_MUX_uxn_opcodes_h_l806_c7_c470_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_return_output := n8_MUX_uxn_opcodes_h_l806_c7_c470_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l817_c7_743c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_return_output;

     -- MUX[uxn_opcodes_h_l815_c15_8d58] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l815_c15_8d58_cond <= VAR_MUX_uxn_opcodes_h_l815_c15_8d58_cond;
     MUX_uxn_opcodes_h_l815_c15_8d58_iftrue <= VAR_MUX_uxn_opcodes_h_l815_c15_8d58_iftrue;
     MUX_uxn_opcodes_h_l815_c15_8d58_iffalse <= VAR_MUX_uxn_opcodes_h_l815_c15_8d58_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l815_c15_8d58_return_output := MUX_uxn_opcodes_h_l815_c15_8d58_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l812_c7_3b2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l806_c7_c470] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l782_c1_3602] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_return_output;

     -- MUX[uxn_opcodes_h_l814_c26_0dd4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l814_c26_0dd4_cond <= VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_cond;
     MUX_uxn_opcodes_h_l814_c26_0dd4_iftrue <= VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_iftrue;
     MUX_uxn_opcodes_h_l814_c26_0dd4_iffalse <= VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_return_output := MUX_uxn_opcodes_h_l814_c26_0dd4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l810_c32_65ee] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_left;
     BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_return_output := BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l793_c3_68b8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_return_output := CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l810_c32_5b20_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l810_c32_65ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l800_c3_634f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l793_c3_68b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue := VAR_MUX_uxn_opcodes_h_l814_c26_0dd4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue := VAR_MUX_uxn_opcodes_h_l815_c15_8d58_return_output;
     VAR_printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l782_c1_3602_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_n8_MUX_uxn_opcodes_h_l806_c7_c470_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_743c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l817_c7_743c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l806_c7_c470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l812_c7_3b2a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- MUX[uxn_opcodes_h_l810_c32_5b20] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l810_c32_5b20_cond <= VAR_MUX_uxn_opcodes_h_l810_c32_5b20_cond;
     MUX_uxn_opcodes_h_l810_c32_5b20_iftrue <= VAR_MUX_uxn_opcodes_h_l810_c32_5b20_iftrue;
     MUX_uxn_opcodes_h_l810_c32_5b20_iffalse <= VAR_MUX_uxn_opcodes_h_l810_c32_5b20_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l810_c32_5b20_return_output := MUX_uxn_opcodes_h_l810_c32_5b20_return_output;

     -- printf_uxn_opcodes_h_l783_c3_8470[uxn_opcodes_h_l783_c3_8470] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l783_c3_8470_uxn_opcodes_h_l783_c3_8470_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l812_c7_3b2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;

     -- n8_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     n8_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     n8_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_return_output := n8_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l812_c7_3b2a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_cond;
     result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output := result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l806_c7_c470] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output;

     -- t16_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := t16_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue := VAR_MUX_uxn_opcodes_h_l810_c32_5b20_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l812_c7_3b2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l806_c7_c470] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l806_c7_c470_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_cond;
     result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iftrue;
     result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_return_output := result_pc_MUX_uxn_opcodes_h_l806_c7_c470_return_output;

     -- t16_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     t16_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     t16_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := t16_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l806_c7_c470] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l806_c7_c470] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_return_output;

     -- n8_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := n8_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l806_c7_c470] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l806_c7_c470_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l806_c7_c470_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l806_c7_c470_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l806_c7_c470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l803_c7_7859] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l803_c7_7859_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_cond;
     result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iftrue;
     result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_return_output := result_pc_MUX_uxn_opcodes_h_l803_c7_7859_return_output;

     -- n8_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     n8_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     n8_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := n8_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- t16_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     t16_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     t16_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := t16_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_7859_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- t16_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     t16_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     t16_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := t16_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- n8_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     n8_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     n8_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := n8_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l799_c7_ef8d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_n8_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l799_c7_ef8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     t16_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     t16_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := t16_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- n8_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     n8_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     n8_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := n8_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l796_c7_95eb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_cond;
     result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_return_output := result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l796_c7_95eb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l791_c7_40b5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_cond;
     result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_return_output := result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;

     -- n8_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     n8_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     n8_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := n8_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l791_c7_40b5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l788_c7_95fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l788_c7_95fa_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l782_c2_daa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l822_l777_DUPLICATE_33d6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l822_l777_DUPLICATE_33d6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_89b6(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l782_c2_daa1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c2_daa1_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l822_l777_DUPLICATE_33d6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l822_l777_DUPLICATE_33d6_return_output;
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
