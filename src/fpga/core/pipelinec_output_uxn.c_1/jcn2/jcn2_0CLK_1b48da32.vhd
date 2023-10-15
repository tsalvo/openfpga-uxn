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
-- Submodules: 75
entity jcn2_0CLK_1b48da32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_1b48da32;
architecture arch of jcn2_0CLK_1b48da32 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l728_c6_9f0b]
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l728_c2_ef40]
signal n8_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c2_ef40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c2_ef40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l728_c2_ef40]
signal result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c2_ef40]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c2_ef40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l728_c2_ef40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l728_c2_ef40]
signal t16_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l733_c11_56ed]
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal n8_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l733_c7_ca9e]
signal t16_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_00c8]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal n8_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l736_c7_1bb1]
signal t16_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l738_c3_750c]
signal CONST_SL_8_uxn_opcodes_h_l738_c3_750c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l738_c3_750c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l741_c11_4f68]
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal n8_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l741_c7_1dc7]
signal t16_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l744_c11_7f59]
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal n8_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l744_c7_7dd5]
signal t16_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l745_c3_ec8d]
signal BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l748_c11_00e2]
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l748_c7_4e8f]
signal n8_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l748_c7_4e8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l748_c7_4e8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l748_c7_4e8f]
signal result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_4e8f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_4e8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_4e8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l751_c11_2be5]
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l751_c7_d21b]
signal n8_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l751_c7_d21b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l751_c7_d21b]
signal result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_d21b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_d21b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_d21b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l754_c32_ccc0]
signal BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l754_c32_37c9]
signal BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l754_c32_4d3e]
signal MUX_uxn_opcodes_h_l754_c32_4d3e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l754_c32_4d3e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l754_c32_4d3e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l754_c32_4d3e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l755_c26_6c3b]
signal BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l755_c26_bb27]
signal MUX_uxn_opcodes_h_l755_c26_bb27_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l755_c26_bb27_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l755_c26_bb27_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l755_c26_bb27_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l756_c15_f602]
signal BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l756_c15_01c0]
signal MUX_uxn_opcodes_h_l756_c15_01c0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l756_c15_01c0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l756_c15_01c0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l756_c15_01c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_134f]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_0c41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_0c41]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_0c41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f07d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b
BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_left,
BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_right,
BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output);

-- n8_MUX_uxn_opcodes_h_l728_c2_ef40
n8_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
n8_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
n8_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
n8_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- result_pc_MUX_uxn_opcodes_h_l728_c2_ef40
result_pc_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- t16_MUX_uxn_opcodes_h_l728_c2_ef40
t16_MUX_uxn_opcodes_h_l728_c2_ef40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l728_c2_ef40_cond,
t16_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue,
t16_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse,
t16_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed
BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_left,
BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_right,
BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output);

-- n8_MUX_uxn_opcodes_h_l733_c7_ca9e
n8_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
n8_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e
result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- t16_MUX_uxn_opcodes_h_l733_c7_ca9e
t16_MUX_uxn_opcodes_h_l733_c7_ca9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l733_c7_ca9e_cond,
t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue,
t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse,
t16_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8
BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output);

-- n8_MUX_uxn_opcodes_h_l736_c7_1bb1
n8_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
n8_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1
result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- t16_MUX_uxn_opcodes_h_l736_c7_1bb1
t16_MUX_uxn_opcodes_h_l736_c7_1bb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l736_c7_1bb1_cond,
t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue,
t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse,
t16_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output);

-- CONST_SL_8_uxn_opcodes_h_l738_c3_750c
CONST_SL_8_uxn_opcodes_h_l738_c3_750c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l738_c3_750c_x,
CONST_SL_8_uxn_opcodes_h_l738_c3_750c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_left,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_right,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output);

-- n8_MUX_uxn_opcodes_h_l741_c7_1dc7
n8_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
n8_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7
result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- t16_MUX_uxn_opcodes_h_l741_c7_1dc7
t16_MUX_uxn_opcodes_h_l741_c7_1dc7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l741_c7_1dc7_cond,
t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue,
t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse,
t16_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59
BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_left,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_right,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output);

-- n8_MUX_uxn_opcodes_h_l744_c7_7dd5
n8_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
n8_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5
result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- t16_MUX_uxn_opcodes_h_l744_c7_7dd5
t16_MUX_uxn_opcodes_h_l744_c7_7dd5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l744_c7_7dd5_cond,
t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue,
t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse,
t16_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d
BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_left,
BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_right,
BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2
BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_left,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_right,
BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output);

-- n8_MUX_uxn_opcodes_h_l748_c7_4e8f
n8_MUX_uxn_opcodes_h_l748_c7_4e8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l748_c7_4e8f_cond,
n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue,
n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse,
n8_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f
result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_cond,
result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue,
result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse,
result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5
BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_left,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_right,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output);

-- n8_MUX_uxn_opcodes_h_l751_c7_d21b
n8_MUX_uxn_opcodes_h_l751_c7_d21b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l751_c7_d21b_cond,
n8_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue,
n8_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse,
n8_MUX_uxn_opcodes_h_l751_c7_d21b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l751_c7_d21b
result_pc_MUX_uxn_opcodes_h_l751_c7_d21b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_cond,
result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue,
result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse,
result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0
BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_left,
BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_right,
BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9
BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_left,
BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_right,
BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_return_output);

-- MUX_uxn_opcodes_h_l754_c32_4d3e
MUX_uxn_opcodes_h_l754_c32_4d3e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l754_c32_4d3e_cond,
MUX_uxn_opcodes_h_l754_c32_4d3e_iftrue,
MUX_uxn_opcodes_h_l754_c32_4d3e_iffalse,
MUX_uxn_opcodes_h_l754_c32_4d3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b
BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_left,
BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_right,
BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_return_output);

-- MUX_uxn_opcodes_h_l755_c26_bb27
MUX_uxn_opcodes_h_l755_c26_bb27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l755_c26_bb27_cond,
MUX_uxn_opcodes_h_l755_c26_bb27_iftrue,
MUX_uxn_opcodes_h_l755_c26_bb27_iffalse,
MUX_uxn_opcodes_h_l755_c26_bb27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602
BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_left,
BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_right,
BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_return_output);

-- MUX_uxn_opcodes_h_l756_c15_01c0
MUX_uxn_opcodes_h_l756_c15_01c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l756_c15_01c0_cond,
MUX_uxn_opcodes_h_l756_c15_01c0_iftrue,
MUX_uxn_opcodes_h_l756_c15_01c0_iffalse,
MUX_uxn_opcodes_h_l756_c15_01c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f
BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output,
 n8_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 t16_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output,
 n8_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 t16_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output,
 n8_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 t16_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output,
 CONST_SL_8_uxn_opcodes_h_l738_c3_750c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output,
 n8_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 t16_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output,
 n8_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 t16_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output,
 n8_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output,
 result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output,
 n8_MUX_uxn_opcodes_h_l751_c7_d21b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output,
 result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_return_output,
 MUX_uxn_opcodes_h_l754_c32_4d3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_return_output,
 MUX_uxn_opcodes_h_l755_c26_bb27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_return_output,
 MUX_uxn_opcodes_h_l756_c15_01c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_9c9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_4bc3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_ef8b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_750c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_750c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_4716 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l746_c3_e3fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_fd6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l748_c7_4e8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_bb27_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_bb27_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_bb27_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l755_c26_bb27_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_01c0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_01c0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_01c0_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l756_c15_01c0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l745_l737_DUPLICATE_e914_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l764_l723_DUPLICATE_3938_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l755_c26_bb27_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_4716 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_4716;
     VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_ef8b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_ef8b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_9c9b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_9c9b;
     VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_iffalse := resize(to_signed(-3, 3), 8);
     VAR_MUX_uxn_opcodes_h_l755_c26_bb27_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_4bc3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_4bc3;
     VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l746_c3_e3fa := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l746_c3_e3fa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_fd6e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l749_c3_fd6e;
     VAR_MUX_uxn_opcodes_h_l756_c15_01c0_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_right := to_unsigned(3, 2);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_left := t16;
     VAR_MUX_uxn_opcodes_h_l756_c15_01c0_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l748_c11_00e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l728_c6_9f0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l733_c11_56ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l745_l737_DUPLICATE_e914 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l745_l737_DUPLICATE_e914_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l741_c11_4f68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_left;
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output := BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output := result.pc;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l748_c7_4e8f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l754_c32_ccc0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_left;
     BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_return_output := BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_00c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l751_c11_2be5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_left;
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output := BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_134f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l756_c15_f602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_left;
     BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_return_output := BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l744_c11_7f59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_left;
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output := BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l755_c26_6c3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l754_c32_ccc0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_9f0b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l733_c11_56ed_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_00c8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4f68_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_7f59_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c11_00e2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_2be5_return_output;
     VAR_MUX_uxn_opcodes_h_l755_c26_bb27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l755_c26_6c3b_return_output;
     VAR_MUX_uxn_opcodes_h_l756_c15_01c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l756_c15_f602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_134f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l745_l737_DUPLICATE_e914_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_750c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l745_l737_DUPLICATE_e914_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_e7a2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l741_l751_l744_l728_l736_l733_l748_DUPLICATE_5813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l741_l751_l744_l736_l758_l733_l748_DUPLICATE_5f29_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_0018_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l741_l744_l728_l736_l758_l733_l748_DUPLICATE_7013_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l748_c7_4e8f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_0c41] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_0c41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_0c41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l754_c32_37c9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_left;
     BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_return_output := BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l738_c3_750c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l738_c3_750c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_750c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_750c_return_output := CONST_SL_8_uxn_opcodes_h_l738_c3_750c_return_output;

     -- MUX[uxn_opcodes_h_l755_c26_bb27] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l755_c26_bb27_cond <= VAR_MUX_uxn_opcodes_h_l755_c26_bb27_cond;
     MUX_uxn_opcodes_h_l755_c26_bb27_iftrue <= VAR_MUX_uxn_opcodes_h_l755_c26_bb27_iftrue;
     MUX_uxn_opcodes_h_l755_c26_bb27_iffalse <= VAR_MUX_uxn_opcodes_h_l755_c26_bb27_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l755_c26_bb27_return_output := MUX_uxn_opcodes_h_l755_c26_bb27_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l745_c3_ec8d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_left;
     BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_return_output := BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_return_output;

     -- MUX[uxn_opcodes_h_l756_c15_01c0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l756_c15_01c0_cond <= VAR_MUX_uxn_opcodes_h_l756_c15_01c0_cond;
     MUX_uxn_opcodes_h_l756_c15_01c0_iftrue <= VAR_MUX_uxn_opcodes_h_l756_c15_01c0_iftrue;
     MUX_uxn_opcodes_h_l756_c15_01c0_iffalse <= VAR_MUX_uxn_opcodes_h_l756_c15_01c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l756_c15_01c0_return_output := MUX_uxn_opcodes_h_l756_c15_01c0_return_output;

     -- n8_MUX[uxn_opcodes_h_l751_c7_d21b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l751_c7_d21b_cond <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_cond;
     n8_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue;
     n8_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_return_output := n8_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l754_c32_37c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l745_c3_ec8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l738_c3_750c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue := VAR_MUX_uxn_opcodes_h_l755_c26_bb27_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue := VAR_MUX_uxn_opcodes_h_l756_c15_01c0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_0c41_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_0c41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_0c41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_d21b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;

     -- t16_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := t16_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_d21b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l751_c7_d21b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_cond;
     result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_return_output := result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- n8_MUX[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l748_c7_4e8f_cond <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_cond;
     n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue;
     n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output := n8_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;

     -- MUX[uxn_opcodes_h_l754_c32_4d3e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l754_c32_4d3e_cond <= VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_cond;
     MUX_uxn_opcodes_h_l754_c32_4d3e_iftrue <= VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_iftrue;
     MUX_uxn_opcodes_h_l754_c32_4d3e_iffalse <= VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_return_output := MUX_uxn_opcodes_h_l754_c32_4d3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_d21b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue := VAR_MUX_uxn_opcodes_h_l754_c32_4d3e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_cond;
     result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output := result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;

     -- n8_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := n8_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l751_c7_d21b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;

     -- t16_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := t16_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l751_c7_d21b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     -- t16_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := t16_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- n8_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := n8_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l748_c7_4e8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l748_c7_4e8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_7dd5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;

     -- n8_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := n8_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- t16_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := t16_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_7dd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_t16_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_1dc7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- n8_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := n8_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- t16_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     t16_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     t16_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := t16_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_n8_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_1dc7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_1bb1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;

     -- n8_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     n8_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     n8_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := n8_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_1bb1_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l733_c7_ca9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l733_c7_ca9e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c2_ef40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l764_l723_DUPLICATE_3938 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l764_l723_DUPLICATE_3938_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f07d(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_ef40_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_ef40_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l764_l723_DUPLICATE_3938_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f07d_uxn_opcodes_h_l764_l723_DUPLICATE_3938_return_output;
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
