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
-- Submodules: 61
entity jmp2_0CLK_f7466064 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_f7466064;
architecture arch of jmp2_0CLK_f7466064 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l593_c6_4fa4]
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l593_c1_b394]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l593_c2_59c9]
signal t16_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l593_c2_59c9]
signal result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c2_59c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l593_c2_59c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l593_c2_59c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c2_59c9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c2_59c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l593_c2_59c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l594_c3_ea81[uxn_opcodes_h_l594_c3_ea81]
signal printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_ebfc]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l599_c7_6974]
signal t16_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l599_c7_6974]
signal result_pc_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_6974]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l599_c7_6974]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_6974]
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_6974]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_6974]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l599_c7_6974]
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l602_c11_cd52]
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal t16_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l602_c7_2e8b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l604_c3_8f25]
signal CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l607_c11_0f70]
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l607_c7_65e0]
signal t16_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l607_c7_65e0]
signal result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l607_c7_65e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l607_c7_65e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l607_c7_65e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l607_c7_65e0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l607_c7_65e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l607_c7_65e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l610_c11_5181]
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l610_c7_9211]
signal t16_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l610_c7_9211]
signal result_pc_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l610_c7_9211]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c7_9211]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l610_c7_9211]
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l610_c7_9211]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l610_c7_9211]
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l611_c3_5bab]
signal BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l614_c32_e231]
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l614_c32_7c6a]
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l614_c32_c98c]
signal MUX_uxn_opcodes_h_l614_c32_c98c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_c98c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_c98c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_c98c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l616_c11_3b91]
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l616_c7_a64f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l616_c7_a64f]
signal result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l616_c7_a64f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l616_c7_a64f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l621_c11_6751]
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_5c7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l621_c7_5c7d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a4db( ref_toks_0 : opcode_result_t;
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
      base.pc := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4
BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_left,
BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_right,
BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_return_output);

-- t16_MUX_uxn_opcodes_h_l593_c2_59c9
t16_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
t16_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
t16_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
t16_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l593_c2_59c9
result_pc_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

-- printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81
printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81 : entity work.printf_uxn_opcodes_h_l594_c3_ea81_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc
BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output);

-- t16_MUX_uxn_opcodes_h_l599_c7_6974
t16_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l599_c7_6974_cond,
t16_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
t16_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
t16_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- result_pc_MUX_uxn_opcodes_h_l599_c7_6974
result_pc_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l599_c7_6974_cond,
result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
result_pc_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52
BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_left,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_right,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output);

-- t16_MUX_uxn_opcodes_h_l602_c7_2e8b
t16_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
t16_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b
result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l604_c3_8f25
CONST_SL_8_uxn_opcodes_h_l604_c3_8f25 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_x,
CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70
BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_left,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_right,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output);

-- t16_MUX_uxn_opcodes_h_l607_c7_65e0
t16_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
t16_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
t16_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
t16_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l607_c7_65e0
result_pc_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181
BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_left,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_right,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output);

-- t16_MUX_uxn_opcodes_h_l610_c7_9211
t16_MUX_uxn_opcodes_h_l610_c7_9211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l610_c7_9211_cond,
t16_MUX_uxn_opcodes_h_l610_c7_9211_iftrue,
t16_MUX_uxn_opcodes_h_l610_c7_9211_iffalse,
t16_MUX_uxn_opcodes_h_l610_c7_9211_return_output);

-- result_pc_MUX_uxn_opcodes_h_l610_c7_9211
result_pc_MUX_uxn_opcodes_h_l610_c7_9211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l610_c7_9211_cond,
result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iftrue,
result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iffalse,
result_pc_MUX_uxn_opcodes_h_l610_c7_9211_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab
BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_left,
BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_right,
BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l614_c32_e231
BIN_OP_AND_uxn_opcodes_h_l614_c32_e231 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_left,
BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_right,
BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a
BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_left,
BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_right,
BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_return_output);

-- MUX_uxn_opcodes_h_l614_c32_c98c
MUX_uxn_opcodes_h_l614_c32_c98c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l614_c32_c98c_cond,
MUX_uxn_opcodes_h_l614_c32_c98c_iftrue,
MUX_uxn_opcodes_h_l614_c32_c98c_iffalse,
MUX_uxn_opcodes_h_l614_c32_c98c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91
BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_left,
BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_right,
BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l616_c7_a64f
result_pc_MUX_uxn_opcodes_h_l616_c7_a64f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_cond,
result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue,
result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse,
result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751
BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_left,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_right,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_return_output,
 t16_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output,
 t16_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 result_pc_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output,
 t16_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output,
 CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output,
 t16_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output,
 t16_MUX_uxn_opcodes_h_l610_c7_9211_return_output,
 result_pc_MUX_uxn_opcodes_h_l610_c7_9211_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_return_output,
 BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_return_output,
 BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_return_output,
 BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_return_output,
 MUX_uxn_opcodes_h_l614_c32_c98c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_return_output,
 result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_a95d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_5536 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_ed07 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l608_c3_02f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l607_c7_65e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_c98c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_c98c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_c98c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_c98c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l607_l599_l610_l602_DUPLICATE_4bbb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_83e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l626_l589_DUPLICATE_835b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l614_c32_c98c_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_a95d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_a95d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_ed07 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_ed07;
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l608_c3_02f8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l608_c3_02f8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_5536 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_5536;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l614_c32_c98c_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l610_c11_5181] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_left;
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output := BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l607_c11_0f70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_left;
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output := BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_83e6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_83e6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l621_c11_6751] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_left;
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output := BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l593_c6_4fa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l614_c32_e231] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_left;
     BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_return_output := BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_ebfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l607_c7_65e0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l602_c11_cd52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_left;
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output := BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l607_l599_l610_l602_DUPLICATE_4bbb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l607_l599_l610_l602_DUPLICATE_4bbb_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l616_c11_3b91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_left;
     BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output := BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_e231_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_4fa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_ebfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_cd52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_0f70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_5181_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_3b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_6751_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_83e6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_83e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_DUPLICATE_924d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l610_l607_l599_l602_l593_l616_DUPLICATE_ee13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l616_DUPLICATE_1a60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l610_l607_l599_l602_l593_DUPLICATE_c53d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l599_l602_l593_l616_DUPLICATE_496d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l607_l599_l610_l602_DUPLICATE_4bbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l607_l599_l610_l602_DUPLICATE_4bbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l607_l599_l610_l602_DUPLICATE_4bbb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l607_l599_l610_l602_DUPLICATE_4bbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l607_c7_65e0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_5c7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l593_c1_b394] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l614_c32_7c6a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_left;
     BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_return_output := BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l616_c7_a64f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_cond;
     result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_return_output := result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l616_c7_a64f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l610_c7_9211] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l621_c7_5c7d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l604_c3_8f25] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_x <= VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_return_output := CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l611_c3_5bab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_left;
     BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_return_output := BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l614_c32_c98c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_7c6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_5bab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_8f25_return_output;
     VAR_printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_b394_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_5c7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_9211_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l610_c7_9211] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l610_c7_9211_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_cond;
     result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iftrue;
     result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_return_output := result_pc_MUX_uxn_opcodes_h_l610_c7_9211_return_output;

     -- t16_MUX[uxn_opcodes_h_l610_c7_9211] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l610_c7_9211_cond <= VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_cond;
     t16_MUX_uxn_opcodes_h_l610_c7_9211_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_iftrue;
     t16_MUX_uxn_opcodes_h_l610_c7_9211_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_return_output := t16_MUX_uxn_opcodes_h_l610_c7_9211_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l616_c7_a64f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l610_c7_9211] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- MUX[uxn_opcodes_h_l614_c32_c98c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l614_c32_c98c_cond <= VAR_MUX_uxn_opcodes_h_l614_c32_c98c_cond;
     MUX_uxn_opcodes_h_l614_c32_c98c_iftrue <= VAR_MUX_uxn_opcodes_h_l614_c32_c98c_iftrue;
     MUX_uxn_opcodes_h_l614_c32_c98c_iffalse <= VAR_MUX_uxn_opcodes_h_l614_c32_c98c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l614_c32_c98c_return_output := MUX_uxn_opcodes_h_l614_c32_c98c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l616_c7_a64f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;

     -- printf_uxn_opcodes_h_l594_c3_ea81[uxn_opcodes_h_l594_c3_ea81] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l594_c3_ea81_uxn_opcodes_h_l594_c3_ea81_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue := VAR_MUX_uxn_opcodes_h_l614_c32_c98c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_a64f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_9211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l610_c7_9211_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l610_c7_9211] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l610_c7_9211] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- t16_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     t16_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     t16_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := t16_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c7_9211] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_9211_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_9211_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_9211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- t16_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := t16_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l607_c7_65e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_65e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_t16_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_return_output := result_pc_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- t16_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     t16_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     t16_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_return_output := t16_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l602_c7_2e8b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_2e8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- t16_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     t16_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     t16_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := t16_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l599_c7_6974] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_6974_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c2_59c9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l626_l589_DUPLICATE_835b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l626_l589_DUPLICATE_835b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a4db(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_59c9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_59c9_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l626_l589_DUPLICATE_835b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a4db_uxn_opcodes_h_l626_l589_DUPLICATE_835b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
